require 'rails_helper'

feature 'Single admin user' do
  scenario 'first user can register' do
    user = build :user

    visit new_user_registration_path

    expect { submit_registration_form user }.to change(User, :count).by(1)
  end

  scenario 'user is redirected to home page after registration' do
    user = build :user

    visit new_user_registration_path
    submit_registration_form user

    expect(page).to have_current_path(root_path)
  end

  scenario 'second user is redirected to login page' do
    create :user

    visit new_user_registration_path

    expect_login_page page
  end
end
