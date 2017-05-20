require 'rails_helper'

feature 'Listing articles', js: false do
  context '(pagination)' do
    let!(:articles) { create_list :article, 7 }

    scenario 'displays 5 articles per page' do
      visit articles_path

      expect(page).to have_text('title', count: 5)
    end

    scenario 'displays total number of published articles' do
      visit articles_path

      expect(page).to have_content('NUMBER OF POSTS: 7')
    end

    scenario 'user views older articles' do
      visit articles_path

      click_on '❯'

      expect(page).to have_text('title', count: 2)
    end
  end

  context '(authentication)' do
    let(:tag) { create :tag }
    let!(:published_article) { create :article, tags: [tag] }
    let!(:wip_article) { create :wip_article }

    context 'when user is guest' do
      scenario 'shows only published articles' do
        visit articles_path

        expect(page).to have_content('NUMBER OF POSTS: 1')
        expect(page).to have_content(published_article.title)
        expect(page).not_to have_content(wip_article.title)
      end

      scenario 'filters published articles by tag' do
        visit tag_path(tag)

        expect(page).to have_content('NUMBER OF POSTS: 1')
        expect(page).to have_content(published_article.title)
        expect(page).not_to have_content(wip_article.title)
      end
    end

    context 'when user is admin' do
      before do
        login
      end

      scenario 'shows all articles' do
        visit articles_path(status: 'all')

        expect(page).to have_content('NUMBER OF POSTS: 2')
        expect(page).to have_css('a', text: wip_article.title)
        expect(page).to have_css('a', text: published_article.title)
      end

      scenario 'shows wip articles' do
        visit articles_path(status: 'wip')

        expect(page).to have_content('NUMBER OF POSTS: 1')
        expect(page).to have_css('a', text: wip_article.title)
        expect(page).not_to have_css('a', text: published_article.title)
      end
    end
  end
end
