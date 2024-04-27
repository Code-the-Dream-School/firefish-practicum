require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
    include Devise::Test::ControllerHelpers
    
    describe "add_path" do
        it "should add a place that has not been saved previously" do
            user = FactoryBot.create :user
            attraction = FactoryBot.create :attraction
            param = { place: {id: attraction.id, place_type: "Attractions" } }

            sign_in user
            
            post :add, params: param
            expect(response).to have_http_status(302)
            expect(flash[:notice]).to be_present
        end

        it "should not add a place that is already saved" do
            user = FactoryBot.create :user
            attraction = FactoryBot.create :attraction

            sign_in user
            user.attractions << attraction

            post :add, params: { place: {id: attraction.id, place_type: "Attractions" } }
            expect(user.attractions.length).to eq(1)
            .and redirect_to search_path
            expect(flash[:alert]).to be_present
        end

        it "should provide an error if the place type is not attraction/hotel/restaurant" do
            user = FactoryBot.create :user
            place = "Brewery"

            sign_in user

            expect {
                post :add, params: { place: {id: 1, place_type: place } }
            }.to raise_error("#{place} is not supported at the moment")
        end
    end
end