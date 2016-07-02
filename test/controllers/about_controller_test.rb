require 'test_helper'

class AboutsControllerTest < ActionController::TestCase
  test 'shows about page' do
    get :show
    assert_response :success
    assert_template :show
  end
end
