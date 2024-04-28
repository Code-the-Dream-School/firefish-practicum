require 'rails_helper'

RSpec.describe AttractionsController, type: :controller do
  let(:attraction) { FactoryBot.create(:attraction) }

  describe "GET #show" do
    context "when the attraction exists" do
      it "renders the show template" do
        get :show, params: { id: attraction.id }
        expect(response).to render_template(:show)
      end

      it "loads the correct attraction" do
        get :show, params: { id: attraction.id }
        expect(assigns(:attraction)).to eq(attraction)
      end
    end

    context "when the attraction does not exist" do
      it "redirects to the root path with an error" do
        get :show, params: { id: 0 }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
