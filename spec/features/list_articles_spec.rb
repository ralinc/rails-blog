require 'rails_helper'

feature 'Listing articles', js: false do
  let(:tag) { create :tag }
  let!(:published_article) { create :article, tags: [tag] }
  let!(:wip_article) { create :wip_article }

  context 'when user is guest' do
    scenario 'show only published articles' do
      visit articles_path

      expect(page).to have_content('NUMBER OF POSTS: 1')
      expect(page).to have_content(published_article.title)
      expect(page).not_to have_content(wip_article.title)
    end

    scenario 'filter published articles by tag' do
      visit tag_path(tag)

      expect(page).to have_content('NUMBER OF POSTS: 1')
      expect(page).to have_content(published_article.title)
      expect(page).not_to have_content(wip_article.title)
    end
  end

  context 'when user is authenticated' do
    before do
      login
    end

    scenario 'when user is authenticated show all articles' do
      visit articles_path(status: 'all')

      expect(page).to have_content('NUMBER OF POSTS: 2')
      expect(page).to have_css('a', text: wip_article.title)
      expect(page).to have_css('a', text: published_article.title)
    end

    scenario 'when user is authenticated show wip articles' do
      visit articles_path(status: 'wip')

      expect(page).to have_content('NUMBER OF POSTS: 1')
      expect(page).to have_css('a', text: wip_article.title)
      expect(page).not_to have_css('a', text: published_article.title)
    end
  end
end
