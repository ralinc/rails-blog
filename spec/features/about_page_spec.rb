require 'rails_helper'

feature 'Visiting about page', js: false do
  scenario 'displays about page' do
    visit page_path('about')

    expect(page).to have_title('About me - Ralin Chimev')
    expect(page).to have_css('h1', text: 'About')
    expect(page).to have_css('a[href="https://github.com/ralinc"]')
    expect(page).to have_css('a[href="https://www.linkedin.com/in/ralinchimev"]')
    expect(page).to have_css('a[href="https://facebook.com/ralin.chimev"]')
    expect(page).to have_css('a[href="mailto:me@ralin.net"]')
  end
end
