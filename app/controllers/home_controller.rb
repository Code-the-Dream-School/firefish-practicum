class HomeController < ApplicationController
    def index
        #sample request
        # response_for_geocode_api = GeoapifyClient.connection.get("/v1/geocode/search") do |req|
        #     req.params['text'] = "Venice Italy"
        #     req.params['format'] = "json"
        # end #response_for_geocode_api.status => 200
        # @response_geo = JSON.parse(response_for_geocode_api.body)
        # @city_place_id = @response_geo['results'][0]['place_id']

        # response_for_places_api = GeoapifyClient.connection.get("/v2/places") do |req|
        #     req.params["categories"] = "tourism.attraction"
        #     req.params["filter"] = "place:" + @city_place_id
        #     req.params["limit"] = 2 #using 5 for now while testing
        # end #response_for_places_api.status => 200
        # @response_place = JSON.parse(response_for_places_api.body) # returns a list of places
        # @attraction_place = @response_place["features"][0]["properties"]["name"] #name of an Attraction

        # @names = @response_place["features"].map { |obj| obj["properties"]["name"] }
    end
end
