class Country < ActiveRecord::Base

	def self.find_price(price, ponderations)
		if price == "alto"
			max = 20
			min = 14
		end
		if price == "medio"
			max = 14
			min = 7
		end
		if price == "bajo"
			max = 7
			min = 0.0
		end
		ponderations.select do |country|
			min <= country[:pond] && country[:pond] <= max
		end
	end	
	def self.ponderations

		ponds = all.map do |country|
			x = 0;
			x += country.impuesto_apertura.to_i * 0.1
			x += country.impuesto_sociedades.to_i * 0.3
			x += country.precio_medio_plato.to_i * 0.3
			x += country.idh.to_i * 0.3
			{name: country.name, pond: x}
		end
	end
end
