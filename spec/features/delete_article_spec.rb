require 'rails_helper'

feature 'Deleting article', js: false do
  let(:article) { create :article }

  scenario 'admin deletes article' do
    login

    visit article_path(article)
    click_on 'DELETE'

    expect(Article.all.size).to be_zero
  end
end
