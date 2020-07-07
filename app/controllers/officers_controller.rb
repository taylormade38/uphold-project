class OfficersController < ApplicationController
  def show
    @officer = Officer.find(params[:id])
    authorize @officer
  end

  def new
  end

  def create
  end
end
