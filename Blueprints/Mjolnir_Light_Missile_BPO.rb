require_relative 'Blueprint'

class Mjolnir_Light_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize()
		super
		@base_materials = {
		:Tritanium => 135,
        :Pyerite   => 16,
        :Mexallon  => 11
		}
	end
end




