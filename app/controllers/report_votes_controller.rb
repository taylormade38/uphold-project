class ReportVotesController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @report_vote = ReportVote.new(user: current_user, report: @report)
    authorize @report_vote
    @report_vote.save
    redirect_to @report.city
  end
end
