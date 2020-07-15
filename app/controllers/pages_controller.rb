class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # List of cities
    @cities = City.all
    # Query Google Search
    if params[:query].present?
      sql_query = "name ILIKE :query OR state ILIKE :query"
      @cities = policy_scope(City).where(sql_query, query: "%#{params[:query]}%")
    else
      @cities = policy_scope(City).order(created_at: :desc)
    end
    # Reference picture link
    # push picture
    if params[:sort].present?
      if params[:sort] == 'up'
        @cities = @cities.sort_by { |city| -city.reports.count }
      elsif params[:sort] == 'down'
        @cities = @cities.sort_by { |city| city.reports.count }
      end
    end
    @user = current_user
  end
end
