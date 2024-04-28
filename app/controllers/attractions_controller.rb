
class AttractionsController < ApplicationController
  def show
    @attraction = Attraction.find_by(id: params[:id])
    unless @attraction
      redirect_to root_path, alert: "Attraction not found"
    end
  end
end
