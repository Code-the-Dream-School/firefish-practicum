class PlacesController < ApplicationController
    def add
        place_id = params[:place][:id].to_i
        place = params[:place][:place_type]
    
        case place
        when "Attractions"
          if current_user.attraction_ids.include?(place_id)
            flash[:alert] = failure_message(place)
          else
            current_user.attractions << Attraction.find(place_id)
            flash[:notice] = success_message(place)
          end
        when "Hotels"
          if current_user.hotel_ids.include?(place_id)
            flash[:alert] = failure_message(place)
          else
            current_user.hotels << Hotel.find(place_id)
            flash[:notice] = success_message(place_id)
          end
        when "Restaurants"
          if current_user.restaurant_ids.include?(place_id)
            flash[:alert] = failure_message(place)
          else
            current_user.restaurants << Restaurant.find(place_id)
            flash[:notice] = success_message(place)
          end
        else
          raise PlaceTypeInvalid.new("#{place} is not supported at the moment")
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
