class Instrument

	attr_reader :code
	attr_reader :code_type
	attr_reader :url
	attr_accessor :series

	def initialize code, code_type, url
		@code = code
		@code_type = code_type
		@url = url
		@series = []
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
		@series << (match = Serie.new(key)) unless match
		return match
	end

	def print doc = nil
		#puts "#{self} #{self.series.size}"
		@series.each do |serie|
			serie.positions.each do |position|
				#puts "[#{position.date}] #{code} => #{serie.name} $#{position.price}"
				doc.write("#{position.date};#{code_type};#{code};#{serie.name};#{position.price}\n") if doc
			end
		end
		if @series.size == 0
			#puts "No Info"
		end
	end

end
