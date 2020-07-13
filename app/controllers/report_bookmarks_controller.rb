class ReportBookmarksController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @report_bookmark = ReportBookmark.new(user: current_user, report: @report)
    authorize @report_bookmark
    @report_bookmark.save
    redirect_to @report.city
  end

  def destroy
    @report = Report.find(params[:report_id])
    @report_bookmark = ReportBookmark.where(user: current_user, report: @report).first
    authorize @report_bookmark
    @report_bookmark.destroy
    redirect_to @report.city
  end
end
