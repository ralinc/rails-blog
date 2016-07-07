ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module SessionTestHelper
  def login_as(user)
    session[:user_id] = users(user).id
  end

  def logged_in?
    session[:user_id].present?
  end
end

module ActiveSupport
  class TestCase
    include SessionTestHelper
    fixtures :all
  end
end

module LoginTestHelper
  def login_as_john
    login_as 'john@example.com', 'password'
  end

  def login_as(email, password)
    get login_path
    assert_response :success
    post_via_redirect login_path, session: {
      email: email,
      password: password
    }
    assert_response :success
    assert_equal articles_path, path
  end
end

module ActionDispatch
  class IntegrationTest
    include LoginTestHelper
  end
end
