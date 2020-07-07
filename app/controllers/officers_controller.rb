class OfficersController < ApplicationController
  def show
    @officer = Officer.find(params[:id])
    authorize @officer
    @reports = @officer.reports
  end

  def new
  end

  def create
  end
end
