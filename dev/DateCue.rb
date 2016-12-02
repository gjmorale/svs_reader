class DateCue

	attr_reader :year
	attr_reader :month
	attr_reader :day

	def initialize day, month, year
		@day = (day < 10 ? "0#{day}" : day.to_s)
		@month = (month < 10 ? "0#{month}" : month.to_s)
		@year = year.to_s
	end

end
