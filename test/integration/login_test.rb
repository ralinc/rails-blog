require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'login' do
    get login_path
    assert_response :success
    post_via_redirect login_path, session: {
      email: 'js@example.com',
      password: 'password'
    }
    assert_equal articles_path, path
    assert_response :success
  end
end
