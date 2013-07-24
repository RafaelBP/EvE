require_relative 'Blueprint'

class Nova_Heavy_Missile_BPO < Blueprint
	attr_reader :base_materials
	def initialize(name)
		super(name)
		@base_materials = {
		:Tritanium =>348,
        :Pyerite   =>118,
        :Mexallon  =>0,
        :Nocxium   =>1,
		}
		@units_per_run = 100
	end
end