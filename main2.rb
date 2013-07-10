# Require Factories
require File.join( File.dirname(__FILE__), "Factories", "BPO_Factory.rb")

# Require Hashes
require File.join( File.dirname(__FILE__), "Hashes", "Minerals.rb")
require File.join( File.dirname(__FILE__), "Hashes", "Systems.rb")
require File.join( File.dirname(__FILE__), "Hashes", "ShipsMinmatar.rb")
require File.join( File.dirname(__FILE__), "Hashes", "Missiles.rb")

# Require Querys 
require File.join( File.dirname(__FILE__), "Querys", "Quotation.rb")

# Require Calculators
# require_relative 'Manufacture'

puts "------------------PROJECT EvE------------------"
puts " - Market Analysis"
puts " - Opportunity Costs"
puts " - Manufacturing Costs"
puts "-----------------------------------------------\n"

q1 = Quotation.new(Minerals::HASH, :Rens)
q1.get_offers(:sell)
q1.get_offers(:buy)

q1.print(:sell_and_buy)
puts " ------------- \n"
q2 = Quotation.new(Missiles::HASH, :Rens)
q2.get_offers(:sell)
q2.get_offers(:buy)

puts "Rens Best Sell Offers"
q2.print(:sell)

puts "Rens Buy Offers"
q2.print(:buy)

puts " ------------- \n"


BPO1 = BPO_Factory.Inferno_Light_Missile

# puts BPO1.base_materials.value
cost = 0.0
BPO1.base_materials.each do |key,value|
	cost = cost + value*1.15*q1.buy_max_offers[key]
end
cost = cost/100.0

puts "Inferno Light Missile Opportunity Cost in Rens Cost : #{cost.round(2)}"


cost = 0.0
BPO1.base_materials.each do |key,value|
	cost = cost + value*1.15*q1.sell_min_offers[key]
end
cost = cost/100.0


puts "Inferno Light Missile Manufacturing Cost in Rens Cost : #{cost.round(2)}"

