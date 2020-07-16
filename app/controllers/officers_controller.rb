class OfficersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @officer = Officer.find(params[:id])
    authorize @officer
    @reports = @officer.reports
    @markers = @reports.map do |report|
      {
        lat: report.latitude,
        lng: report.longitude
      }
    end
  end

  def new
  end

  def create
  end

end
