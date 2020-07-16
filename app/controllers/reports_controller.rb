class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show ]

  def new
    @report = Report.new
    @officers = City.all.map do |city|
        officers = city.officers.map do |officer|
            {id: officer.id, text: officer.full_name}
        end
        { id: city.id, text: city.name, children: officers }
    end

    authorize @report
  end

  def create
    @report = Report.new(report_params)
    authorize @report
    unless params[:other][:user_city] == ""
      city = City.find(params[:other][:user_city])
      current_user.city = city
      current_user.save
    end
    @report.user = current_user
    # @report.city = City.find(params[:report][:city_id])
    # See if officer exists

    # If so, assign officer to report
    @report.officer = Officer.find_or_create_by(id: params[:report][:officer_id]) do |officer|
        officer.id = Officer.last.id + 1
        full_name = params[:report][:officer_id].split(" ")
        officer.first_name = full_name[0]
        officer.last_name = full_name[1]
        officer.city = City.find(params[:other][:user_city])
        officer.save
    end
    # If not, add officer
    if @report.save

      redirect_to city_path(@report.city)
    else
      render :new
    end
  end

  def show
    authorize @report
  end

  def edit
    authorize @report
  end

  def update
    authorize @report
    @report.update(report_params)
    redirect_to report_path(@report)
  end

  def destroy
    authorize @report
    @report.destroy
    redirect_to city_path(@city)
  end

  def enrich_report
    enriched_data = Scraper.call
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:content, :evaluation, :address, :city_id, :officer_id, photos:[])
  end
end
