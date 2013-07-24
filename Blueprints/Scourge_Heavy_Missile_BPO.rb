require_relative 'Blueprint'

class Scourge_Heavy_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium =>812,
        :Pyerite   =>0,
        :Mexallon  =>0,
        :Nocxium   =>2,
		}
		@units_per_run = 100
	end
end