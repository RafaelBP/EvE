require_relative 'Blueprint'

class Inferno_Light_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium =>52,
        :Pyerite   =>65
		}
	end
end



