module SessionHelper
  def login
    user = create(:user)
    visit login_path
    submit_login_form user
  end

  def submit_login_form(user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'
  end

  def expect_login_page(page)
    expect(page).to have_content('Login')
    expect(page).to have_css('input[type=email]')
    expect(page).to have_css('input[type=password]')
    expect(page).to have_css('input[type=submit]')
  end
end
