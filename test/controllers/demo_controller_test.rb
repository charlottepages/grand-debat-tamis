require 'test_helper'

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get demo_search_url
    assert_response :success
  end

  test "should get show" do
    get demo_show_url
    assert_response :success
  end

  test "should get list" do
    get demo_list_url
    assert_response :success
  end

  test "should get engage" do
    get demo_engage_url
    assert_response :success
  end

end
