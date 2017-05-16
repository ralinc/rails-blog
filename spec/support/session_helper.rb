module SessionHelper
  def login
    user = create(:user)
    visit new_user_session_path
    submit_login_form user
  end

  def submit_login_form(user)
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign In'
    end
  end

  def submit_registration_form(user)
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_on 'Sign up'
    end
  end

  def expect_login_page(page)
    expect(page).to have_title('Sign In - Ralin Chimev')
    expect(page).to have_css('input[type=email]')
    expect(page).to have_css('input[type=password]')
    expect(page).to have_css('input[type=submit]')
  end
end
