class Instrument

	attr_reader :code
	attr_reader :code_type
	attr_reader :url
	attr_accessor :series

	def initialize code, code_type, url, serie = nil
		@code = code
		@code_type = code_type
		@url = url
		@series = []
		@unique = (not (serie.nil? or serie.empty?))
		@series << Serie.new(serie) if @unique
	end 

	def add_serie(serie)
		if @series.select{|s| s.name == serie}.empty?
			@series << Serie.new(serie)
		end
	end

	def to_s
		line = ""
		series.map{|s| line << "|#{s.name}|"}
		"#{@code} #{line}"
	end

	def inspect
		to_s
	end

	def get_serie key
		match = nil
		series.map{|serie| match = serie if serie.name == key}
		@series << (match = Serie.new(key)) unless match or @unique
		return match
	end

	def print doc = nil, log = nil
		@series.each do |serie|
			serie.positions.each do |position|
				doc.write("#{code_type};#{code};#{position.date};#{position.price};p_cierre;#{serie.name}\n") if doc
			end
		end
		if @series.size == 0
			extra = ""
			extra << ". Try another name for the serie." if @unique
			log.write("No series recorded for #{@code} #{extra}\n")
		else
			log.write("#{@series.size} serie#{'s' if @series.size > 1} recorded for #{@code}.\n")
		end
	end

end
