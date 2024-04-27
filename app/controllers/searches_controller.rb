class SearchesController < ApplicationController
  def index
    if params[:city_name].present?
      selected_place_types = []
      selected_place_types << 'attractions' if params[:place_type_attractions] == 'attractions'
      selected_place_types << 'hotels' if params[:place_type_hotels] == 'hotels'
      selected_place_types << 'restaurants' if params[:place_type_restaurants] == 'restaurants'

      @places = selected_place_types.flat_map do |place_type|
        SearchLogic.get_places_from_city_string(params[:city_name], place_type)
      end

      render :index
    end
  end
end
