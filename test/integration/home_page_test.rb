require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "home page layout" do
    get root_path 
    assert_response :success
    assert_select "title", "Ralin Chimev personal website"
  end
end
