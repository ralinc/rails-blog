require 'rails_helper'

feature 'Reading article', js: false do
  scenario 'can read article without logging in' do
    article = create :article

    visit article_path(article)

    expect(page).to have_content(article.title)
    expect(page).to have_content(article.content)
  end

  scenario 'renders markdown content' do
    article = create :article, content: '*markdown*'

    visit article_path(article)

    expect(page).to have_css('em', text: 'markdown')
  end

  scenario 'forces login when viewing unpublished article' do
    article = create :wip_article

    visit article_path(article)

    expect_login_page page
  end
end
