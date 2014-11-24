class Country < ActiveRecord::Base

	def self.find_price(price, ponderations)
		if price == "alto"
			max = 100
			min = 70
		end
		if price == "medio"
			max = 69
			min = 40
		end
		if price == "bajo"
			max = 39
			min = 1
		end
		ponderations.select do |country|
			true#min <= country[:pond] && country[:pond] <= max
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
