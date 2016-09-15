require 'rails_helper'

feature 'Reading article', js: false do
  let(:article) { create :article, content: '*markdown*' }

  scenario 'guest reads article' do
    visit article_path(article)

    expect(page).to have_content(article.title)
    expect(page).to have_css('em', text: 'markdown')
  end
end
