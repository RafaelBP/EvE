require File.join(File.dirname(__FILE__), "..","Blueprints","Inferno_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Mjolnir_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Nova_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Scourge_Light_Missile_BPO.rb")


# require '~/Desktop/RUBY/Project_EvE/Blueprints/Inferno_Light_Missile_BPO.rb'
# require '~/Desktop/RUBY/Project_EvE/Blueprints/Mjolnir_Light_Missile_BPO.rb'
# require '~/Desktop/RUBY/Project_EvE/Blueprints/Nova_Light_Missile_BPO.rb'
# require '~/Desktop/RUBY/Project_EvE/Blueprints/Scourge_Light_Missile_BPO.rb'


module BPO_Factory
	def self.Inferno_Light_Missile
		return Inferno_Light_Missile_BPO.new("Inferno Light Missile")
	end

	def self.Mjolnir_Light_Missile
		return Mjolnir_Light_Missile_BPO.new("Mjolnir Light Missile")
	end

	def self.Nova_Light_Missile
		return Mjolnir_Light_Missile_BPO.new("Nova Light Missile")
	end

	def self.Scourge_Light_Missile
		return Mjolnir_Light_Missile_BPO.new("Scourge Light Missile")
	end	
end