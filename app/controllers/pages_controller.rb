class PagesController < ApplicationController
	def index
		params[:nueva_apertura] = params[:nueva_apertura] == true.to_s
		@countries = Country.scored_countries(params[:coste_plato], params[:nueva_apertura])
	end
end
