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
      # else
      #   flash.now[:alert] = 'Please enter a city name and select a type to search'
      #   @places = []
      #   # render :index
    end
  end

  def add_to_favorites
    place_id = params[:id].to_i
    place = params[:place_type].singularize

    case place
    when "Attraction"
      if current_user.attraction_ids.include?(place_id)
        flash[:alert] = failure_message(place)
      else
        current_user.attractions << Attraction.find(place_id)
        flash[:notice] = success_message(place)
      end
    when "Hotel"
      if current_user.hotel_ids.include?(place_id)
        flash[:alert] = failure_message(place)
      else
        current_user.hotels << Hotel.find(place_id)
        flash[:notice] = success_message(place_id)
      end
    when "Restaurant"
      if current_user.restaurant_ids.include?(place_id)
        flash[:alert] = failure_message(place)
      else
        current_user.hotels << Restaurant.find(place_id)
        flash[:notice] = success_message(place)
      end
    end

    redirect_to search_path
  end

  private

    def failure_message(place_type)
      "The #{place_type} has already been added please select another one"
    end

    def success_message(place_type)
      "The #{place_type} was added successfully"
    end
end
