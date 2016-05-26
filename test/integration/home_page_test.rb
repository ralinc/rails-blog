require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test 'home page layout' do
    get root_path
    assert_response :success
    assert_template 'homes/show'
    assert_select 'title', 'Ralin Chimev personal website'
    assert_select 'nav a[href=?]', root_path, count: 2
    assert_select 'nav a[href=?]', about_path
    assert_select '.jumbotron a[href=?]', about_path
    assert_select '.marketing h2', count: 3
    assert_select 'footer'
  end
end
