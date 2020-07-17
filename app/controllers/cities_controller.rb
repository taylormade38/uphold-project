class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @city = City.find(params[:id])
    authorize @city
    if params[:query]
      @reports = Report.all.left_joins(:report_votes).order('COUNT(report_votes.report_id) DESC').group("reports.id, #{PgSearch::Configuration.alias('reports')}.rank")
      @reports = @reports.geocoded.search_by_tag(params[:query])
      # @reports = Report.all
    else
      @reports = @city.reports.geocoded
      # @reports = Report.where.not(latitude: nil, longitude: nil)
    end

    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude
      }
    end
  end

  def sort
    @cities = City.all
    if params[:sort].present?
      if params[:sort] == 'up'
        @cities = @cities.sort_by { |city| -city.reports.count }
      elsif params[:sort] == 'down'
        @cities = @cities.sort_by { |city| city.reports.count }
      end
      respond_to do |f|
        f.html { redirect_to root_path }
        f.js
      end
      authorize City
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
