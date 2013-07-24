module Calculator

	def self.production_cost(mineral_quote, bpo, char)
		cost = 0.0
		waste = (1.25 - 0.05*char.skills[:production_efficiency]) + bpo.base_waste/(1 + bpo.ME)
		bpo.base_materials.each do |key,value|
			cost = cost + value*waste*mineral_quote.sell_min_offers[key]
		end
		cost = cost/bpo.units_per_run

		return cost.round(2)
	end

	def self.opportunity_cost(mineral_quote, bpo, char)
		cost = 0.0
		waste = (1.25 - 0.05*char.skills[:production_efficiency]) + bpo.base_waste/(1 + bpo.ME)
		bpo.base_materials.each do |key,value|
			cost = cost + value*waste*mineral_quote.buy_max_offers[key]
		end
		cost = cost/bpo.units_per_run

		return cost.round(2)
	end
end 