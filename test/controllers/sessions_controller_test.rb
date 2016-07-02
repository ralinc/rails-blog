require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'gets login page' do
    get :new
    assert_response :success
    assert_template :new
  end

  test 'creates a session' do
    post :create, session: { email: 'js@example.com', password: 'password' }
    assert session[:user_id]
    assert_redirected_to articles_path
  end

  test 'does not create a session with wrong credentials' do
    post :create, session: { email: 'wrong@example.com', password: 'password' }
    assert_not session[:user_id]
    assert_template :new
  end

  test 'destroys session' do
    login_as :john
    delete :destroy
    assert_not session[:user_id]
    assert_redirected_to root_path
  end
end
