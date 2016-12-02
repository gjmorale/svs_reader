class Serie

	attr_reader :name
	attr_accessor :positions

	def initialize name
		@name = name
		@positions = []
	end

	def to_s
		"#{name}: #{positions}"
	end

	def inspect
		"#{@date_start.to_s} - #{@date_finish.to_s} #{@name}"
	end

end