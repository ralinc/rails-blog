require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: 'js@example.com', password: 'password' }
    assert_redirected_to articles_path
  end

  test 'logout' do
    delete logout_path
    assert_redirected_to root_path
  end

  test 'login with wrong credentials fails' do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: 'wrong@example.com', password: '123' }
    assert_template 'sessions/new'
  end
end
