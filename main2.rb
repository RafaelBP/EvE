# Require Factories
require File.join( File.dirname(__FILE__), "Factories", "BPO_Factory.rb")

# Require Hashes
require File.join( File.dirname(__FILE__), "Hashes", "Minerals.rb")
require File.join( File.dirname(__FILE__), "Hashes", "Systems.rb")
require File.join( File.dirname(__FILE__), "Hashes", "ShipsMinmatar.rb")
require File.join( File.dirname(__FILE__), "Hashes", "Missiles.rb")

# Require Querys 
require File.join( File.dirname(__FILE__), "Querys", "Quotation.rb")

# Require EvE_Charater
require File.join( File.dirname(__FILE__), "Character", "EvE_Character.rb")

# Require Calculators
require File.join( File.dirname(__FILE__), "Calculators", "Calculator.rb")
# require_relative 'Manufacture'

class String
	def red;            "\033[31m#{self}\033[0m" end
	def green;          "\033[32m#{self}\033[0m" end
	def blue;           "\033[34m#{self}\033[0m" end
	def bold;           "\033[1m#{self}\033[22m" end
end

puts "------------------PROJECT EvE------------------"
puts " - Market Analysis"
puts " - Opportunity Costs"
puts " - Manufacturing Costs"
puts "-----------------------------------------------\n"

vincent = EvE_Character.new("Vincent Caerbannog")
	vincent.skills[:production_efficiency] = 3
	vincent.skills[:mass_production] = 0

# heavy_missiles = [ :Inferno_Heavy_Missile, :Mjolnir_Heavy_Missile,
# 				   :Nova_Heavy_Missile   , :Scourge_Heavy_Missile ]

# light_missiles = [ :Inferno_Light_Missile, :Mjolnir_Light_Missile,
#                    :Nova_Light_Missile   ,   :Scourge_Light_Missile]

q1 = Quotation.new(Minerals::HASH, :Rens)
q1.get_offers(:sell)
q1.get_offers(:buy)

q1.print(:sell_and_buy)
puts " ------------- \n"

q2 = Quotation.new(Missiles::HASH, :Rens)
q2.get_offers(:sell)
q2.get_offers(:buy)

puts "#{q2.system} Best Sell Offers"
q2.print(:sell)

puts " ------------- \n"
puts "#{q2.system} Buy Offers"
q2.print(:buy)

puts " ------------- \n"


bpo1 = BPO_Factory.Inferno_Light_Missile
bpo2 = BPO_Factory.Mjolnir_Light_Missile
bpo3 = BPO_Factory.Nova_Light_Missile
bpo4 = BPO_Factory.Scourge_Light_Missile

bpo5 = BPO_Factory.Inferno_Heavy_Missile
bpo6 = BPO_Factory.Mjolnir_Heavy_Missile
bpo7 = BPO_Factory.Nova_Heavy_Missile
bpo8 = BPO_Factory.Scourge_Heavy_Missile


bpo_array = [bpo1, bpo2, bpo3, bpo4, bpo5, bpo6, bpo7, bpo8]

bpo_array.each do |key|
	c1  = Calculator.production_cost(q1,key, vincent)
    c2  =  Calculator.opportunity_cost(q1,key, vincent)

	puts "#{key.name} Manufacturing Cost (Rens Minerals Based) : #{c1}"
	puts "#{key.name} Opportunity   Cost (Rens Minerals Based) : #{c2}"
	markup = ((q2.sell(key.name) - c1) / c1).round(2)
	profit_margin  = ((q2.sell(key.name) - c1) / q2.sell(key.name)).round(2)

	if markup > 0.5 then
		puts "Markup        = " + "#{markup}".green
		puts "Profit Margin = " + "#{profit_margin}".green
	else
		puts "Markup        = " + "#{markup}"
		puts "Profit Margin = " + "#{profit_margin}"
	end
	
	puts " ------------- \n"

end
