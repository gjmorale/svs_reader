class Position

	attr_reader :price
	attr_reader :date

	def initialize date, price
		@date = date
		@price = price
	end

	def to_s
		"#{@date.to_s} - $#{@price}"
	end

	def inspect
		to_s
	end

end