require 'test_helper'

class AboutPageTest < ActionDispatch::IntegrationTest
  test 'about page' do
    get about_path
    assert_response :success
    assert_template 'abouts/show'
    assert_select 'title', 'About me'
    assert_select '.social-links a[href=?]', 'https://github.com/ralinc'
    assert_select '.social-links a[href=?]', 'https://www.linkedin.com/in/ralinchimev'
    assert_select '.social-links a[href=?]', 'https://facebook.com/ralin.chimev'
    assert_select '.social-links a[href=?]', 'mailto:ralin.chimev@gmail.com'
  end
end
