require 'rails_helper'

feature 'Signing in', js: false do
  scenario 'authenticates user with correct credentials' do
    visit login_path
    submit_login_form create(:user)
    expect(page).to have_css('a', text: 'Logout')
  end
end
