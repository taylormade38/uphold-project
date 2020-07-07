class CitiesController < ApplicationController
  def show
  end

  def index
    @cities = City.all
  end
end
