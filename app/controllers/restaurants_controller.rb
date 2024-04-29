class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    unless @restaurant
      redirect_to root_path, alert: "Restaurant not found"
    end
  end
end