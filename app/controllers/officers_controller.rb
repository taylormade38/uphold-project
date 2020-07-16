class OfficersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

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
