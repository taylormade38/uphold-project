class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # List of cities
    @cities = City.all
    # Query Google Search
    # Reference picture link
    # push picture
  end
end
