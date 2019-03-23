require 'test_helper'

class SavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @safe = saves(:one)
  end

  test "should get index" do
    get saves_url
    assert_response :success
  end

  test "should get new" do
    get new_safe_url
    assert_response :success
  end

  test "should create safe" do
    assert_difference('Save.count') do
      post saves_url, params: { safe: {  } }
    end

    assert_redirected_to safe_url(Save.last)
  end

  test "should show safe" do
    get safe_url(@safe)
    assert_response :success
  end

  test "should get edit" do
    get edit_safe_url(@safe)
    assert_response :success
  end

  test "should update safe" do
    patch safe_url(@safe), params: { safe: {  } }
    assert_redirected_to safe_url(@safe)
  end

  test "should destroy safe" do
    assert_difference('Save.count', -1) do
      delete safe_url(@safe)
    end

    assert_redirected_to saves_url
  end
end
