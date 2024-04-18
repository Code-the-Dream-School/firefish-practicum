module SearchLogic
    SEARCH_LIMIT = 20

    class << self
        def get_places_from_city_string(city_name, place_type)
            category = case place_type
            when "attractions"
              "tourism.attraction"
            when "hotels"
              "accommodation.hotel"
            when "restaurants"
              "catering.restaurant"
            else
              raise PlaceTypeInvalid.new("Error: The place type used is not supported at the moment")
            end

            city = get_city_from_name(city_name)
            places = city.public_send(place_type).limit(SEARCH_LIMIT).to_a
            return if places.count >= SEARCH_LIMIT
            
            response = get_place_details(category, city.city_place_id)
            send("create_#{place_type}", response, city)
        end

        private

        def get_city_from_name(city_name)
            city = City.find_by(name: city_name)
            return city if city

            response = get_geocode_response(city_name)
            city_place_id = extract_city_place_id(response)
            name = extract_city_name(response)
            city = City.find_or_create_by(city_place_id:)
            city.name = name
            city.save!
            city
        end

        def get_geocode_response(city_name_from_search)
            response_from_geocode_api = GeoapifyClient.connection.get("/v1/geocode/search") do |req|
                req.params['text'] = city_name_from_search #the city name from params
                req.params['format'] = "json"
            end
            JSON.parse(response_from_geocode_api.body) 
        end 

        def extract_city_place_id(json_data)
            city_place_id = json_data['results'][0]['place_id']
        end

        def extract_city_name(json_data)
            results_obj = json_data["results"][0]
            city_name = results_obj["city"] + ", " + results_obj["country"]
        end

        def create_city(city_place_id, city_name)
            City.new(city_place_id: city_place_id, name: city_name)
        end

        def get_place_details(category, city_place_id)
            response_for_places_api = GeoapifyClient.connection.get("/v2/places") do |req|
                req.params["categories"] = category
                req.params["filter"] = "place:#{city_place_id}"
                req.params["limit"] = 20
            end
            JSON.parse(response_for_places_api.body)
        end

        def create_attractions(response, city)
            response["features"].map do |place| 
                props = place["properties"]
                dataraw = props["datasource"]["raw"]

                attraction_place_id = props["place_id"]
                name = props["name"]
                email = dataraw["email"]
                phone = dataraw["phone"]
                website = dataraw["website"]
                address = props["formatted"]
                image_url = dataraw["image"]
                toilets = dataraw["toilets"]
                wheelchair = dataraw["wheelchair"]
                changing_table = dataraw["changing_table"]

                city.attractions.create(attraction_place_id:, name:, email:, phone:, website:, address:, image_url:, toilets:, wheelchair:, changing_table:)
            end
        end

        def create_hotels(response, city)
            response["features"].map do |place| 
                props = place["properties"]
                dataraw = props["datasource"]["raw"]
                
                hotel_place_id = props["place_id"]
                name = props["name"]
                email = dataraw["email"]
                phone = dataraw["phone"]
                website = dataraw["website"]
                address = props["formatted"]
                image_url = dataraw["image"]
                wheelchair = dataraw["wheelchair"]
                stars = dataraw["stars"]

                city.hotels.create(hotel_place_id:, name:, email:, phone:, website:, address:, image_url:, wheelchair:, stars:)
            end
        end

        def create_restaurants(response, city)
            response["features"].map do |place| 
                props = place["properties"]
                dataraw = props["datasource"]["raw"]

                restaurant_place_id = props["place_id"]
                name = props["name"]
                email = dataraw["email"]
                phone = dataraw["phone"]
                website = dataraw["website"]
                address = props["formatted"]
                image_url = dataraw["image"]
                cuisine = dataraw["cuisine"]
                wheelchair = dataraw["wheelchair"]
                indoor_seating = dataraw["indoor_seating"]
                outdoor_seating = dataraw["outdoor_seating"]

                city.restaurants.create(restaurant_place_id:, name:, email:, phone:, website:, address:, image_url:, cuisine:, wheelchair:, indoor_seating:, outdoor_seating:)
            end
        end
    end
end
