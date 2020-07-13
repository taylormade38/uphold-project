require 'test_helper'

class ReportVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get report_votes_create_url
    assert_response :success
  end

end
