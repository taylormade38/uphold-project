class ReportBookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user && !user.report_bookmarks.pluck(:report_id).include?(record.report_id)
  end

  def destroy?
    user && user.report_bookmarks.pluck(:report_id).include?(record.report_id) && record.user == user
  end
end
