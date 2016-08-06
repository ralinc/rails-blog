require 'rails_helper'

feature 'Editing article', js: false do
  let(:article) { create :article }

  scenario 'updates article when logged in' do
    login
    visit edit_article_path(article)

    fill_in 'Title', with: 'New title'
    fill_in 'Content', with: 'New content'
    click_on 'Save'

    expect(current_path).to eq article_path(article)
    expect(page).to have_content 'New title'
    expect(page).to have_content 'New content'

    article.reload
    expect(article.title).to eq 'New title'
    expect(article.content).to eq 'New content'
  end

  scenario 'does not update article with invalid data' do
    login
    visit edit_article_path(article)

    fill_in 'Title', with: ''
    fill_in 'Slug', with: ''
    fill_in 'Content', with: ''
    click_on 'Save'

    expect(page).to have_content("can't be blank")
    expect(page).to have_css('input[type=submit]')

    article.reload
    expect(article.title).not_to eq ''
    expect(article.slug).not_to eq ''
    expect(article.content).not_to eq ''
  end

  scenario 'does not display edit link when not logged in' do
    visit edit_article_path(article)

    expect(page).not_to have_content 'EDIT'
  end

  scenario 'forces login' do
    visit edit_article_path(article)

    expect_login_page page
  end
end
