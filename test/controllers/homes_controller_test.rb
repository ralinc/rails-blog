require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "show home page" do
    get :show 
    assert_response :success
    assert_template :show
  end
end
