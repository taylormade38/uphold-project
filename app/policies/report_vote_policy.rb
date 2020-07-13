class ReportVotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !user.report_votes.pluck(:report_id).include?(record.report_id)
  end
end
