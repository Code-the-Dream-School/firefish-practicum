class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find_by(id: params[:id])
    unless @hotel
      redirect_to root_path, alert: "Hotel not found"
    end
  end
end