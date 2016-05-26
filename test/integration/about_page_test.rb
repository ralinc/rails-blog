require 'test_helper'

class AboutPageTest < ActionDispatch::IntegrationTest
  test 'about page' do
    get about_path
    assert_response :success
    assert_template 'abouts/show'
    assert_select 'title', 'About me'
  end
end
