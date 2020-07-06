require 'test_helper'

class OfficersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get officers_show_url
    assert_response :success
  end

  test "should get new" do
    get officers_new_url
    assert_response :success
  end

  test "should get create" do
    get officers_create_url
    assert_response :success
  end

end
