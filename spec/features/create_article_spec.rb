require 'rails_helper'

feature 'Creating article', js: false do
  let(:title) { 'Good Code' }
  let(:content) { 'Writing good code is hard' }

  scenario 'admin creates article' do
    login

    visit new_article_path

    fill_in 'Title', with: title
    fill_in 'Slug', with: 'good-code'
    fill_in 'Date', with: '2017-05-20 15:07:54'
    fill_in 'Tags', with: 'tag1, tag2'
    fill_in 'Content', with: content
    select 'published', from: 'Status'
    click_on 'Save'

    expect(page).to have_current_path('/articles/good-code')
    expect(page).to have_content(title)
    expect(page).to have_content('tag1')
    expect(page).to have_content('tag2')
    expect(page).to have_content(content)

    expect(Article.last).to have_attributes(title: title, content: content)
  end
end
