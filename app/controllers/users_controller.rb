class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    # Your custom logic for the user dashboard
    @user = current_user
    # Add any other data you want to display on the dashboard
  end
end
