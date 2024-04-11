class HomeController < ApplicationController
    def index
        response = SearchLogic.get_place_details("attractions", "5194a2957b81c9024059ece5d2533f6d4840f00101f9016517010000000000c00208")
        debugger
    end
end
