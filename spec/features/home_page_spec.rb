require 'rails_helper'

feature 'Visiting home page', js: false do
  scenario 'displays hello message' do
    visit root_path

    expect(page).to have_title('Home - Ralin Chimev')
    expect(page).to have_content('I am Ralin')
  end
end
