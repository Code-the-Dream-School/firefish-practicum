class SearchesController < ApplicationController
    def index
        @places = SearchLogic.get_places_from_city_string(params[:city_name], params[:place_type])
        render params[:place_type]
    end
end
