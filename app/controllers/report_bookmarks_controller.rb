class ReportBookmarksController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @report_bookmark = ReportBookmark.new(user: current_user, report: @report)
    authorize @report_bookmark
    @report_bookmark.save
    respond_to do |format|
      format.html { redirect_to @report.city }
      format.js
    end
  end

  def destroy
    @report = Report.find(params[:report_id])
    @report_bookmark = ReportBookmark.where(user: current_user, report: @report).first
    authorize @report_bookmark
    @report_bookmark.destroy
    respond_to do |format|
      format.html { redirect_to @report.city }
      format.js
    end
  end
end
