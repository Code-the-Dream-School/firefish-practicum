require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let(:restaurant) { FactoryBot.create(:restaurant) }

  describe "GET #show" do
    context "when the restaurant exists" do
      it "renders the show template" do
        get :show, params: { id: restaurant.id }
        expect(response).to render_template(:show)
      end

      it "loads the correct restaurant" do
        get :show, params: { id: restaurant.id }
        expect(assigns(:restaurant)).to eq(restaurant)
      end
    end

    context "when the restaurant does not exist" do
      it "redirects to the root path with an error" do
        get :show, params: { id: 0 }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
