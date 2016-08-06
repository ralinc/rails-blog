require 'rails_helper'

feature 'Signing in', js: false do
  let(:user) { create :user }

  scenario 'logins user with correct credentials' do
    visit login_path

    submit_login_form user

    expect(page).to have_css('a', text: 'Logout')
  end

  scenario 'does not login not existing user' do
    visit login_path

    fill_in 'Email', with: 'abcd@example.com'
    fill_in 'Password', with: '12345'
    click_on 'Login'

    expect_login_page page
    expect(page).not_to have_css('a', text: 'Logout')
  end

  scenario 'does not login user with wrong password' do
    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong'
    click_on 'Login'

    expect_login_page page
    expect(page).not_to have_css('a', text: 'Logout')
  end
end
