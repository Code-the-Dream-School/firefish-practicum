require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #dashboard' do
    let(:user) { create(:user) } # User factory must be set up

    before do
      sign_in(user) # authentication using Devise
    end

    # it 'renders the dashboard template' do
    #   get :dashboard
    #   expect(response).to render_template(:dashboard)
    # end

    # it 'assigns the current user' do
    #   get :dashboard
    #   expect(assigns(:current_user)).to eq(user)
    # end
  end

  describe 'POST #update' do
    let(:user) { create(:user) }
    let(:new_attributes) { 
      { username: 'new_username', 
        # avatar: 'avatar_url' 
      } 
    }

    before { sign_in(user) } # authentication using Devise

    it 'updates user attributes' do
      post :update, params: { id: user.id, user: new_attributes }
      user.reload
      expect(user.username).to eq('new_username')
      # expect(user.avatar).to eq('avatar_url')
    end

    it 'redirects to the dashboard' do
      post :update, params: { id: user.id, user: new_attributes }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end

=begin
RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'creates a new user' do
      expect {
        post :create, params: { user: attributes_for(:user) }
      }.to change(User, :count).by(1)
    end

    # Add more test cases as needed for other actions
  end
end
=end