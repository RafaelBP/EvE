require_relative 'Blueprint'

class Scourge_Light_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium => 68,
        :Pyerite   => 43,
        :Mexallon  => 2
		}
	end
end
