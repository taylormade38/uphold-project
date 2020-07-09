class DashboardsController < ApplicationController
  def dashboard
    @reports = current_user.reports
  end
end
