class ReportVotesController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @report_vote = ReportVote.new(user: current_user, report: @report)
    authorize @report_vote
    @report_vote.save
    respond_to do |format|
      format.html { redirect_to @report.city }
      format.js
    end
  end

  def destroy
    @report_vote = ReportVote.find(params[:id])
    @report = Report.find(@report_vote.report.id)
    authorize @report_vote
    @report_vote.destroy
    respond_to do |format|
      format.html { redirect_to @report.city }
      format.js
    end
  end
end
