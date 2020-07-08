class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    authorize @city
    @reports = Report.where.not(latitude: nil, longitude: nil)
    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude
      }
    end
  end

  def index
    @cities = City.all
    authorize @city
  end
end
