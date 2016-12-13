class DateCue

	attr_reader :year
	attr_reader :month
	attr_reader :day

	def initialize str
		vars = str.split('/')
		day = vars[0].to_i
		month = vars[1].to_i
		year = vars[2].to_i
		@day = (day < 10 ? "0#{day}" : day.to_s)
		@month = (month < 10 ? "0#{month}" : month.to_s)
		@year = year.to_s
	end

	def to_s
		"#{day}/#{month}/#{year}"
	end

	def inspect
		to_s
	end

end
