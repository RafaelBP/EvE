require 'open-uri'
require 'rexml/document'

# Require Hashes
require File.join( File.dirname(__FILE__),"..", "Hashes", "Minerals.rb")
require File.join( File.dirname(__FILE__),"..", "Hashes", "Systems.rb")


class Quotation
	include Minerals
	include Systems
	include REXML

	REMOTE_BASE_URL = "http://api.eve-central.com/api/marketstat?"

	attr_reader :sell_min_offers, :buy_max_offers
	
	def initialize(items_hash, system_symb)
		@sell_min_offers = {}
		@buy_max_offers = {}
		@items  = items_hash   #hash
		@system = system_symb  #symbol

	end

	def get_offers(offertype)
		appended_url = REMOTE_BASE_URL
		@items.each_value do |item_id|
				appended_url  += "&typeid=" + item_id.to_s 
		end
		remote_full_url = appended_url + "&usesystem=" + Systems::HASH[@system].to_s

		#Generate xml doc
		remote_data = open(remote_full_url).read
		xmldoc      = Document.new(remote_data)

		xmldoc.elements.each("evec_api/marketstat/type") do |e| 
			item_symbol   = @items.invert[e.attributes["id"].to_i]

			if    (offertype == :sell) then
				item_price    = e.elements["sell"].elements["min"].text
				@sell_min_offers[item_symbol] = item_price.to_f
			elsif (offertype == :buy) then
				item_price    = e.elements["buy"].elements["max"].text
				@buy_max_offers[item_symbol] = item_price.to_f
			end
		end
	end

	def print(offertype)

		if offertype == :sell  then
			@sell_min_offers.each do |key,value|
				printf " %-30s %12.2f \n", key, value
			end
		elsif offertype == :buy then
			@buy_max_offers.each do |key,value|
				printf " %-30s %12.2f \n", key, value
			end
		elsif offertype == :sell_and_buy then
			printf " %-30s %-12s %-12s \n", "Item", "Sell", "Buy"
			@sell_min_offers.each do |key,value|
				printf " %-30s %12.2f %12.2f \n", key, value, @buy_max_offers[key]
			end
		end
	end
end
