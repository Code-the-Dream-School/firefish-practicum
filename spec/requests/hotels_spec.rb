require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  let(:hotel) { FactoryBot.create(:hotel) }

  describe "GET #show" do
    context "when the hotel exists" do
      it "renders the show template" do
        get :show, params: { id: hotel.id }
        expect(response).to render_template(:show)
      end

      it "loads the correct hotel" do
        get :show, params: { id: hotel.id }
        expect(assigns(:hotel)).to eq(hotel)
      end
    end

    context "when the hotel does not exist" do
      it "redirects to the root path with an error" do
        get :show, params: { id: 0 }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
