require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test 'home page layout' do
    get root_path
    assert_response :success
    assert_template 'homes/show'
    assert_select 'title', 'Ralin Chimev personal website'
    assert_select 'nav a[href=?]', root_path, count: 2
    assert_select 'footer'
  end
end
