require 'test_helper'

class ReportBookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get report_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get report_bookmarks_destroy_url
    assert_response :success
  end

end
