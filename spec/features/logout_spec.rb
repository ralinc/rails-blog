require 'rails_helper'

feature 'Signing out', js: false do
  scenario 'logs out user' do
    login

    click_on 'Logout'

    visit new_article_path
    expect_login_page page
  end
end
