require 'test_helper'

class AuthenticatorTest < ActiveSupport::TestCase
  test 'login' do
    assert Authenticator.login('john@example.com', 'password')
  end

  test 'login failed (wrong password)' do
    assert_not Authenticator.login('john@example.com', 'incorrect')
  end

  test 'login failed (user not found)' do
    assert_not Authenticator.login('missing@example.com', 'password')
  end
end
