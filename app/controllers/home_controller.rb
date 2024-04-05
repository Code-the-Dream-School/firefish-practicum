class HomeController < ApplicationController
    def index
        #sample request
        # response_for_geocode_api = GeoapifyClient.connection.get("/v1/geocode/search") do |req|
        #     req.params['text'] = "Venice Italy"
        #     req.params['format'] = "json"
        # end #response_for_geocode_api.status => 200

        # response_for_places_api = GeoapifyClient.connection.get("/v2/places") do |req|
        #     req.params["categories"] = "tourism.attraction"
        #     req.params["filter"] = "place:517e26b15a4fab284059590e3edef5b74640f00101f901c5ae000000000000c00207"
        #     req.params["limit"] = 5 #using 5 for now while testing
        # end #response_for_places_api.status => 200
    end
end
