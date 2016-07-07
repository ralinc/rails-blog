require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test 'home page layout as guest' do
    get root_path
    assert_select 'title', 'Ralin Chimev personal website'
    assert_select 'nav a[href=?]', root_path
    assert_select 'nav a[href=?]', about_path
    assert_select 'nav a[href=?]', articles_path
    assert_select 'nav a[href=?]', login_path
    assert_select 'footer'
  end

  test 'home page layout if logged in' do
    login_as_john
    get root_path
    assert_select 'title', 'Ralin Chimev personal website'
    assert_select 'nav a[href=?]', root_path
    assert_select 'nav a[href=?]', about_path
    assert_select 'nav a[href=?]', articles_path
    assert_select 'nav a[href=?]', logout_path
    assert_select 'footer'
  end
end
