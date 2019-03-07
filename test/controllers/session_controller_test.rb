require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get company_new" do
    get session_company_new_url
    assert_response :success
  end

  test "should get company_create" do
    get session_company_create_url
    assert_response :success
  end

  test "should get user_new" do
    get session_user_new_url
    assert_response :success
  end

  test "should get user_create" do
    get session_user_create_url
    assert_response :success
  end

  test "should get destroy" do
    get session_destroy_url
    assert_response :success
  end

end
