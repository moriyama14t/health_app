require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login_form" do
    get login_login_form_url
    assert_response :success
  end

end
