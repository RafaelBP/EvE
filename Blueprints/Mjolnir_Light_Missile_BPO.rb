require_relative 'Blueprint'

class Mjolnir_Light_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium => 149,
        :Pyerite   => 18,
        :Mexallon  => 12
		}
		@units_per_run = 100
	end
end