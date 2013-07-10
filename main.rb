require 'open-uri'
require 'rexml/document'

include REXML

require_relative 'Minerals'
require_relative 'Systems'
require_relative './Factories/BPO_Factory'
require_relative 'Quotation'
now = Time.now()
puts now

puts ' --- RENS Sell OFFER --- '
syst_id = Systems::HASH[:Rens]

remote_base_url = "http://api.eve-central.com/api/marketstat?"

Minerals::HASH.each_value do |id|
	remote_base_url  += "&typeid=" + id.to_s 
end
remote_full_url = remote_base_url + "&usesystem=" + syst_id.to_s


# Create a output
# outputfile = File.open("output.txt", "a")

	remote_data = open(remote_full_url).read
	xmldoc = Document.new(remote_data)

	price = {}
	xmldoc.elements.each("evec_api/marketstat/type") do |e| 
		mineral   = Minerals::HASH.invert[e.attributes["id"].to_i].to_s
		its_price = e.elements["sell"].elements["min"].text
		out_str   = "id - " + mineral + " -- " + its_price

		# out_str = "id - " + Minerals::HASH.invert[e.attributes["id"].to_i].to_s + " -- " + e.elements["sell"].elements["avg"].text
		puts out_str
		price[Minerals::HASH.invert[e.attributes["id"].to_i]] = its_price.to_f
	end
puts '       '
puts ' ----- JITA buy OFFER ------ '
syst_id = Systems::HASH[:Jita]

remote_base_url = "http://api.eve-central.com/api/marketstat?"

Minerals::HASH.each_value do |id|
	remote_base_url  += "&typeid=" + id.to_s 
end
remote_full_url = remote_base_url + "&usesystem=" + syst_id.to_s


# Create a output
# outputfile = File.open("output.txt", "a")

	remote_data = open(remote_full_url).read
	xmldoc = Document.new(remote_data)

	price = {}
	xmldoc.elements.each("evec_api/marketstat/type") do |e| 
		mineral   = Minerals::HASH.invert[e.attributes["id"].to_i].to_s
		its_price = e.elements["buy"].elements["max"].text
		out_str   = "id - " + mineral + " -- " + its_price

		# out_str = "id - " + Minerals::HASH.invert[e.attributes["id"].to_i].to_s + " -- " + e.elements["sell"].elements["avg"].text
		puts out_str
		price[Minerals::HASH.invert[e.attributes["id"].to_i]] = its_price.to_f
	end
	


#Agora calcula o custo de um Inferno_Light_Missile
	# inferno = BPO_Factory.Inferno_Light_Missile()
	# total = 0
	# inferno.base_materials.each do |key, value|
	# 	# puts price[key]*value
	# 	total += price[key]*value
	# end
	# puts "RENS Custo total de manufatura 1 un. de Inferno Light Missile: #{total/100}"


	

	
# outputfile.write Time.now()
# outputfile.write "\n"
# outputfile.close

puts " --- "
