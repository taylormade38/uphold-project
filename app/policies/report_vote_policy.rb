class ReportVotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user && !user.report_votes.pluck(:report_id).include?(record.report_id)
  end

  def destroy?
    user && user.report_votes.pluck(:report_id).include?(record.report_id)
  end
end
