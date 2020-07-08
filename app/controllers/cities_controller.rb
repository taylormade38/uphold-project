class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    authorize @city
    if params[:query]
      @reports = Report.search_by_tag(params[:query]).where(city: @city)
    else
      @reports = @city.reports
    end
  end

  def index
    @cities = City.all
    authorize @city
  end
end
