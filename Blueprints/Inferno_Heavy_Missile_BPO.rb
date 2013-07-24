require_relative 'Blueprint'

class Inferno_Heavy_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium =>708,
        :Pyerite   =>2,
        :Mexallon  =>6,
        :Nocxium   =>3,
		}
		@units_per_run = 100
	end
end
