class Blueprint
	attr_reader :name, :base_waste
	attr_accessor :units_per_run,:ME, :TE
	
	def initialize(name)
		@name = name
		@base_waste = 0.10 
		@ME = 0              #Materials Efficiency 
		@TE = 0              #Time Efficiency
		@units_per_run = 1
	end

end 