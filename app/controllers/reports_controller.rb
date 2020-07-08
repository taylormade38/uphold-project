class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.new
    authorize @report
  end

  def create
    @report = Report.new(report_params)
    authorize @report
    @report.user = current_user
    @report.city = City.find(params[:report][:city_id])
    @report.officer = Officer.find(params[:report][:officer_id])
    if @report.save!
      redirect_to report_path(@report)
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

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:content, :evaluation, :address, :city_id, :officer_id)
  end
end
