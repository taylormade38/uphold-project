class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # List of cities
    @cities = City.all
    # Query Google Search
    if params[:query].present?
      @cities = City.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cities = City.all
    end
    # Reference picture link
    # push picture
    @user = current_user
  end
end
