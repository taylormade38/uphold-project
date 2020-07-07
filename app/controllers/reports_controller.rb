class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def new
    @report = Report.new
    authorize @report
  end

  def create
    authorize @report
    @report = Report.new(report_params)
    @report.user = current_user
    if @report.save
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
    params.require(:report).permit(:city, :content, :evaluation)
  end
end
