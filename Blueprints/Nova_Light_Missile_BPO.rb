require_relative 'Blueprint'

class Nova_Light_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium => 61,
        :Pyerite   => 15,
        :Mexallon  => 6
		}
	end
end
