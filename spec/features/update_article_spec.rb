require 'rails_helper'

feature 'Editing article', js: false do
  let(:article) { create :article }

  scenario 'admin updates article' do
    login

    visit edit_article_path(article)

    fill_in 'Title', with: 'new'
    fill_in 'Content', with: 'abc'
    click_on 'Save'

    expect(page).to have_content 'new'
    expect(page).to have_content 'abc'
    expect(article.reload).to have_attributes(title: 'new', content: 'abc')
  end
end
