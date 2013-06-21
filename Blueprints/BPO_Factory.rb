require '~/Desktop/RUBY/Project_EvE/Blueprints/Inferno_Light_Missile_BPO.rb'
require '~/Desktop/RUBY/Project_EvE/Blueprints/Mjolnir_Light_Missile_BPO.rb'


module BPO_Factory
	def self.Inferno_Light_Missile
		return Inferno_Light_Missile_BPO.new("Inferno Light Missile")
	end

	def self.Mjolnir_Light_Missile
		return Mjolnir_Light_Missile_BPO.new("Mjolnir Light Missile")
	end
end
