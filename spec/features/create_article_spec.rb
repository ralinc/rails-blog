require 'rails_helper'

feature 'Creating article', js: false do
  scenario 'creates article with valid data' do
    login
    visit new_article_path

    fill_in 'Title', with: 'title'
    fill_in 'Slug', with: 'slug'
    fill_in 'Content', with: 'content'
    select 'published', from: 'Status'
    click_on 'Save'

    expect(page).to have_content('title')
    expect(page).to have_content('content')

    expect(Article.last.title).to eq('title')
    expect(Article.last.content).to eq('content')
  end

  scenario 'cannot create article with invalid data' do
    login
    visit new_article_path

    click_on 'Save'

    expect(page).to have_content("can't be blank")
    expect(Article.all.size).to be_zero
  end

  scenario 'cannot create article if not logged in' do
    visit new_article_path

    expect_login_page page
  end
end
