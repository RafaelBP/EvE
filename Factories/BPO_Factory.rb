require File.join(File.dirname(__FILE__), "..","Blueprints","Inferno_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Mjolnir_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Nova_Light_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Scourge_Light_Missile_BPO.rb")

require File.join(File.dirname(__FILE__), "..","Blueprints","Inferno_Heavy_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Mjolnir_Heavy_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Nova_Heavy_Missile_BPO.rb")
require File.join(File.dirname(__FILE__), "..","Blueprints","Scourge_Heavy_Missile_BPO.rb")


module BPO_Factory
	def self.Inferno_Light_Missile
		return Inferno_Light_Missile_BPO.new(:Inferno_Light_Missile)
	end

	def self.Mjolnir_Light_Missile
		return Mjolnir_Light_Missile_BPO.new(:Mjolnir_Light_Missile)
	end

	def self.Nova_Light_Missile
		return Nova_Light_Missile_BPO.new(:Nova_Light_Missile)
	end

	def self.Scourge_Light_Missile
		return Scourge_Light_Missile_BPO.new(:Scourge_Light_Missile)
	end	

	def self.Inferno_Heavy_Missile
		return Inferno_Heavy_Missile_BPO.new(:Inferno_Heavy_Missile)
	end

	def self.Mjolnir_Heavy_Missile
		return Mjolnir_Heavy_Missile_BPO.new(:Mjolnir_Heavy_Missile)
	end

	def self.Nova_Heavy_Missile
		return Nova_Heavy_Missile_BPO.new(:Nova_Heavy_Missile)
	end

	def self.Scourge_Heavy_Missile
		return Scourge_Heavy_Missile_BPO.new(:Scourge_Heavy_Missile)
	end
end