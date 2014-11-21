class PagesController < ApplicationController
	def index
		ponds = Country.ponderations
		@countries = Country.find_price params[:precio], ponds
	end
end
