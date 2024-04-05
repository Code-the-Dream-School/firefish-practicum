require 'rails_helper'

RSpec.describe "/users", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  
  describe "GET /new" do
    it "renders a successful response" do
      get new_user_session_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      # it "creates a new User" do
      #   expect {
      #     post new_user_registration_path, params: { user: valid_attributes }
      #   }.to change(User, :count).by(1)
      # end

      # it "redirects to the created user" do
      #   post new_user_registration_path, params: { user: valid_attributes }
      #   expect(response).to redirect_to(user_url(User.last))
      # end
    end

    context "with invalid parameters" do
      # it "does not create a new User" do
      #   expect {
      #     post new_user_registration_path, params: { user: invalid_attributes }
      #   }.to change(User, :count).by(0)
      # end

      # it "renders a response with 422 status (i.e. to display the 'new' template)" do
      #   post new_user_registration_path, params: { user: invalid_attributes }
      #   expect(response).to have_http_status(:unprocessable_entity)
      # end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }
    end
  end
end
