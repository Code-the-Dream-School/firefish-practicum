require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /home" do
    it "Ensure that the page has a Sign in button" do
      get root_path
      expect(response.body.include?("Sign in")).to be true
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /users/sign_in" do
    it "renders the sign in page" do
      get new_user_session_path
      expect(response).to render_template(:new)
    end
  end
  describe "POST /users/sign_in" do
    it "allows a valid account to sign in" do
      user = FactoryBot.create(:user)
      sign_in(user)
      get new_user_session_path
      expect(response).to have_http_status(302)
    end
    it "when the user is signed display a 'Welcome'" do
      user = FactoryBot.create(:user)
      sign_in(user)
      get root_path
      expect(response.body.include?("Welcome")).to be true
    end
    it "an invalid account fails to sign in" do
      post user_session_path, params: { user: { email: "notauser@notregisregisterd.com", password: "864632"} }
      expect(response).to have_http_status(422)
    end
  end
  describe "DELETE /users/sign_out" do
    it "allows a user to logout after signing in" do
      user = FactoryBot.create(:user)
      sign_in(user)
      delete destroy_user_session_path
      expect(response).to have_http_status(303)
    end
  end
  describe "GET /users/sign_up" do
    it "renders the sign up page" do
      get new_user_registration_path
      expect(response).to render_template(:new)
    end
  end
end
