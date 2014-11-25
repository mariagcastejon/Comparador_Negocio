class Country < ActiveRecord::Base

	def self.scored_countries(coste_plato, nueva_apertura)
		all.map do |country|
			{
				name: country.name,
				score: country.calculate_score(coste_plato, nueva_apertura)
			}
		end
	end

	def calculate_from_price(coste_plato)
		(self.precio_medio_plato - coste_plato.to_i).abs
	end

	
	def calculate_score(coste_plato, nueva_apertura)
		distancia_precio = calculate_from_price(coste_plato)
		coste_apertura = nueva_apertura ? self.impuesto_apertura : 0
		coste_anual = self.impuesto_sociedades * 12

		#distancia_precio_per = 100 - [100, distancia_precio].min
		#coste_anual_per = 100 - (coste_anual * 100 / 420)
		#coste_apertura_per = 100 - (coste_apertura * 100 / 15)

		distancia_precio_per(distancia_precio) * 0.6 + coste_apertura_per(coste_apertura) * 0.2 + coste_anual_per(coste_anual) * 0.2
	end

	def distancia_precio_per(distancia_precio)
		(100 - [100, distancia_precio].min)
	end

	def coste_anual_per(coste_anual)
		(100 - (coste_anual * 100 / 420))
	end

	def coste_apertura_per(coste_apertura)
		(100 - (coste_apertura * 100 / 15))
	end
end
