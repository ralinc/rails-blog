require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'login' do
    get login_path
    assert_response :success
    post_via_redirect login_path, session: {
      email: 'john@example.com',
      password: 'password'
    }
    assert_response :success
    assert_equal articles_path, path
    assert logged_in?
  end

  test 'login with unknown user' do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
    post login_path, session: { email: 'josh', password: 'password' }
    assert_template 'sessions/new'
    assert_not logged_in?
  end

  test 'login with wrong password' do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
    post login_path, session: { email: 'john@example.com', password: 'pass' }
    assert_template 'sessions/new'
    assert_not logged_in?
  end

  test 'logout' do
    login_as_john
    assert logged_in?
    delete_via_redirect logout_path
    assert_response :success
    assert_equal root_path, path
    assert_not logged_in?
  end
end
