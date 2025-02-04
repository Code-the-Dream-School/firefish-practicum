RSpec.describe SearchLogic do
    it "saves new attractions" do
        geocode_stub = geocode_venice
        places_stub = stub_request(:get, venice_request_url("tourism.attraction")).to_return(status: 200, body: File.read("spec/responses/attractions_venice.json"))

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions")
            expect(result).to all(be_a(Attraction))
            expect(result.length).to be(20)
        }.to change(City, :count).by(1).and change(Attraction, :count).by(20)

        expect(geocode_stub).to have_been_requested.times(1)
        expect(places_stub).to have_been_requested.times(1)
    end

    it "saves new hotels" do
        geocode_stub = geocode_venice
        places_stub = stub_request(:get, venice_request_url("accommodation.hotel")).to_return(status: 200, body: File.read("spec/responses/hotels_venice.json"))

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "hotels")
            expect(result).to all(be_a(Hotel))
            expect(result.length).to be(20)
        }.to change(City, :count).by(1).and change(Hotel, :count).by(20)

        expect(geocode_stub).to have_been_requested.times(1)
        expect(places_stub).to have_been_requested.times(1)
    end
    
    it "saves new restaurants" do
        geocode_stub = geocode_venice
        places_stub = stub_request(:get, venice_request_url("catering.restaurant")).to_return(status: 200, body: File.read("spec/responses/restaurants_venice.json"))

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "restaurants")
            expect(result).to all(be_a(Restaurant))
            expect(result.length).to be(20)
        }.to change(City, :count).by(1).and change(Restaurant, :count).by(20)

        expect(geocode_stub).to have_been_requested.times(1)
        expect(places_stub).to have_been_requested.times(1)
    end

    it "does not create a city if it is already in the database" do
        places_stub = stub_request(:get, venice_request_url("tourism.attraction")).to_return(status: 200, body: File.read("spec/responses/attractions_venice.json"))

        city = create_venice

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions")
            expect(result).to all(be_a(Attraction))
            expect(result.length).to be(20)
        }.to change(City, :count).by(0).and change(Attraction, :count).by(20)

        expect(places_stub).to have_been_requested.times(1)
    end

    it "does not create a place that is already in the database" do
        places_stub = stub_request(:get, venice_request_url("tourism.attraction")).to_return(status: 200, body: File.read("spec/responses/attractions_venice.json"))
        city = create_venice
        city.attractions.create(attraction_place_id: "5137f3e7f9abad284059a631e8687ab74640f00102f9013a654c0c0000000092031d4269626c696f74656361204e617a696f6e616c65204d61726369616e61", name:"Biblioteca Nazionale Marciana", address: "Marciana National Library, 3, 30124 Venice VE, Italy")

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions")
            expect(result).to all(be_a(Attraction))
            expect(result.length).to be(20)
        }.to change(Attraction, :count).by(19)

        expect(places_stub).to have_been_requested.times(1)
    end

    it "allows the user to search for the City name without the Country" do
        geocode_stub = stub_request(:get, %r{https://api.geoapify.com/v1/geocode/search\?apiKey=[^&]+&format=json&text=Venice}).to_return(status: 200, body: File.read("spec/responses/geocode_venice.json"))
        places_stub = stub_request(:get, venice_request_url("tourism.attraction")).to_return(status: 200, body: File.read("spec/responses/attractions_venice.json"))

        expect {
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions")
            expect(result).to all(be_a(Attraction))
            expect(result.length).to be(20)
        }.to change(City, :count).by(1).and change(Attraction, :count).by(20)

        expect(geocode_stub).to have_been_requested.times(1)
        expect(places_stub).to have_been_requested.times(1)
    end

    it "provides an error when the place type is not valid" do
        expect{
            SearchLogic.get_places_from_city_string("Venice, Italy", "Some Beach")
        }.to raise_error(PlaceTypeInvalid)
    end

    it "should not call the Places API when data already exists" do
        city = create_venice
        attractions = create_list(:attraction, 20, city: city)

        expect{
            result = SearchLogic.get_places_from_city_string("Venice, Italy", "attractions")
            expect(result).to all(be_a(Attraction))
            expect(result.length).to be(20)
        }.to change(City, :count).by(0).and change(Attraction, :count).by(0)
    end
    private

    def geocode_venice
        stub_request(:get, %r{https://api.geoapify.com/v1/geocode/search\?apiKey=[^&]+&format=json&text=Venice,%20Italy}).to_return(status: 200, body: File.read("spec/responses/geocode_venice.json"))
    end

    def venice_request_url(category)
        %r{https://api.geoapify.com/v2/places\?apiKey=[^&]+&categories=#{category}&filter=place:517e26b15a4fab284059590e3edef5b74640f00101f901c5ae000000000000c0020792030e33303132312d33303137362b6974&limit=20}
    end

    def create_venice
        City.create(city_place_id: "517e26b15a4fab284059590e3edef5b74640f00101f901c5ae000000000000c0020792030e33303132312d33303137362b6974", name: "Venice, Italy")
    end
end