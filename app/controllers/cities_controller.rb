class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    authorize @city
    if params[:query]
      @reports = Report.search_by_tag(params[:query]).where(city: @city)
    else
      @reports = @city.reports
      # @reports = Report.where.not(latitude: nil, longitude: nil)
      @markers = @reports.map do |report|
        {
          lat: report.latitude,
          lng: report.longitude
        }
      end
    end
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR state ILIKE :query"
      @cities = policy_scope(City).where(sql_query, query: "%#{params[:query]}%")
    else
      @cities = policy_scope(City).order(created_at: :desc)
    end
      @markers = Report.geocoded.map do |report|
    {
      lat: report.latitude,
      lng: report.longitude
    }
    end
  end
end
