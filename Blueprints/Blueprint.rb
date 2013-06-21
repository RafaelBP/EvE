class Blueprint
	attr_reader :name

	def initialize(name)
		@name = name
		@base_waste = 10 
		@ME = 0              #Materials Efficiency 
		@TE = 0              #Time Efficiency
	end
end