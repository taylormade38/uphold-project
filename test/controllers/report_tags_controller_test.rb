require 'test_helper'

class ReportTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get report_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get report_tags_destroy_url
    assert_response :success
  end

end
