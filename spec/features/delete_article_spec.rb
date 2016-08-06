require 'rails_helper'

feature 'Deleting article', js: false do
  let(:article) { create :article }

  scenario 'deletes article when logged in' do
    login
    visit article_path(article)

    click_on 'DELETE'

    expect(current_path).to eq articles_path
    expect(Article.all.size).to be_zero
  end

  scenario 'does not display delete button when not logged in' do
    visit article_path(article)

    expect(page).not_to have_content 'DELETE'
  end
end
