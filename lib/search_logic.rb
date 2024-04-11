module SearchLogic
    class << self
        def get_places_from_city_string(city_name, place_type)
            city = get_city_from_name(city_name)
            places = city.public_send(place_type)
            if places.empty?
                response = get_place_details(city.city_place_id)
                case place_type
                when "attractions"
                    attraction_place_id = response["features"].map { |place| place["properties"]["place_id"] } 
                    name = response["features"].map { |place| place["properties"]["name"] }
                    email = response["features"].map { |place| place["properties"]["datasource"]["raw"]["email"] }
                    phone = response["features"].map { |place| place["properties"]["datasource"]["raw"]["phone"] }
                    website = response["features"].map { |place| place["properties"]["datasource"]["raw"]["website"] }
                    address = response["features"].map { |place| place["properties"]["formatted"] }
                    image_url =  response["features"].map { |place| place["properties"]["datasource"]["raw"]["image"] }
                    toilets = response["features"].map { |place| place["properties"]["datasource"]["raw"]["toilets"] }
                    wheelchair = response["features"].map { |place| place["properties"]["datasource"]["raw"]["wheelchair"] }
                    changing_table = response["features"].map { |place| place["properties"]["datasource"]["raw"]["changing_table"] }
                when "hotels"
                    # hotel_place_id
                    # name
                    # email
                    # phone
                    # website
                    # address
                    # image_url
                    # wheelchair
                    # stars
                when "restaurant"
                    # restaurant_place_id
                    # name
                    # email
                    # phone
                    # website
                    # address
                    # image_url
                    # cuisine
                    # wheelchair
                    # indoor_seating
                    # outdoor_seating
                end
            else
                places
            end
        end

        #private

        def get_city_from_name(city_name)
            city = City.find_by(name: city_name)
            return city if city

            response = get_geocode_response(city_name)
            city_place_id = extract_city_place_id(response)
            name = extract_city_name(response)
            City.find_or_create_by(city_place_id:, name:)
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

        def get_place_details(place_type, city_place_id)
            case place_type
            when "attractions"
                category = "tourism.attraction"
            when "hotels"
                category = "accommodation.hotel"
            when "restaurants"
                category = "catering.restaurant"
            end

            response_for_places_api = GeoapifyClient.connection.get("/v2/places") do |req|
                req.params["categories"] = category
                req.params["filter"] = "place:#{city_place_id}"
                req.params["limit"] = 5 #using 5 for now while testing
            end
            JSON.parse(response_for_places_api.body)
        end

    end
end