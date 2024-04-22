class UsersController < ApplicationController
  before_action :authenticate_user!
  
  # def dashboard
  #   # display current user
  #   @user = current_user
  # end

  # def create
  #   @user = User.new(user_params)
  #   @user.avatar.attach(io: File.open('path/to/default_profile.png'), filename: 'default_profile.png') unless params[:user][:avatar].present?
  #   # Other create logic...
  # end

  # def update
  #   @user = current_user
  #   if @user.update(user_params)
  #     @user.avatar.attach(params[:avatar]) if params[:avatar]
  #     redirect_to @user, notice: 'Profile updated successfully.'
  #   else
  #     render :edit
  #   end
  # end
end
