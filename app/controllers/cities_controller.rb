class CitiesController < ApplicationController
  def index
    @cities = if params[:query].present?
      City.where("name ILIKE ?", "%#{params[:query]}%")
    else
      City.all
    end

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @city = City.find(params[:id])
  end
end
