RSpec.describe SearchLogic do
    it "saves new attractions" do
        geocode_stub = stub_request(:get, %r{https://api.geoapify.com/v1/geocode/search\?apiKey=[^&]+&format=json&text=Venice,%20Italy}).to_return(status: 200, body: File.read("spec/responses/geocode_venice.json"))
        
        places_stub = stub_request(:get, %r{https://api.geoapify.com/v2/places\?apiKey=[^&]+&categories=tourism.attraction&filter=place:517e26b15a4fab284059590e3edef5b74640f00101f901c5ae000000000000c0020792030e33303132312d33303137362b6974&limit=20}).to_return(status: 200, body: File.read("spec/responses/attractions_venice.json"))

        expect { 
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions") 
        }.to change(City, :count).by(1).and change(Attraction, :count).by(20)

        expect(geocode_stub).to have_been_requested.times(1)
        expect(places_stub).to have_been_requested.times(1)
        
        result = []
        expect(result).to all(be_a(Attraction))
    end

    #new hotels
    #new restaurants
    #already in the database

end