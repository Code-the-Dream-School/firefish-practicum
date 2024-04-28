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
            flash[:notice] = success_message(place)
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

    def destroy
      id = params[:place][:id]
      place_type = params[:place][:type]

      current_user.public_send(place_type).delete(id)

      respond_to do |format|
        format.html { redirect_to root_path, notice: "The #{place_type.singularize} was removed" }
        format.json { head :no_content }
      end
    end

    def destroy_all
      current_user.attractions.destroy_all
      current_user.hotels.destroy_all
      current_user.restaurants.destroy_all

      respond_to do |format|
        format.html { redirect_to root_path, notice: 'All places were removed' }
        format.json { head :no_content }
      end
    end
    
      private
        def failure_message(place_type)
          "The #{place_type.singularize} has already been added please select another one"
        end
    
        def success_message(place_type)
          "The #{place_type.singularize} was added successfully"
        end
end
