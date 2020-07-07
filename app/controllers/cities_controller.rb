class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    authorize @city
  end

  def index
    @cities = City.all
    authorize @city
  end
end
