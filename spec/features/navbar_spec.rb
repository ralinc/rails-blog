require 'rails_helper'

feature 'Showing navigation bar' do
  scenario 'displays navigation links when logged in' do
    login

    visit root_path

    expect(page).to have_css('a', text: 'Home')
    expect(page).to have_css('a', text: 'About')
    expect(page).to have_css('a', text: 'Blog')
    expect(page).to have_css('a', text: 'Logout')
  end

  scenario 'displays navigation links when not logged in' do
    visit root_path

    expect(page).to have_css('a', text: 'Home')
    expect(page).to have_css('a', text: 'About')
    expect(page).to have_css('a', text: 'Blog')
    expect(page).to have_css('a', text: 'Admin')
  end
end
