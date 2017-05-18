require 'rails_helper'

feature 'Signing in', js: false do
  let(:user) { create :user }

  scenario 'authenticates user with correct credentials' do
    visit new_user_session_path
    submit_login_form user.email, user.password
    expect(page).to have_css('a', text: 'Logout')
  end

  scenario 'locks user after 3 failed attempts' do
    visit new_user_session_path

    3.times do
      submit_login_form user.email, 'wrong'
    end

    expect(user.reload.locked_at).not_to be_blank
  end

  scenario 'user cannot login when locked' do
    locked_user = create :user, locked_at: DateTime.current

    visit new_user_session_path
    submit_login_form locked_user.email, locked_user.password

    expect_login_page page
  end
end
