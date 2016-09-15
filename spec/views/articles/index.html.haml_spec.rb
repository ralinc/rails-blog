require 'rails_helper'

describe 'articles/index.html.haml' do
  context 'when user is authenticated' do
    before do
      user = create :user
      create_session_for user
    end

    it 'displays admin links' do
      assign(:articles, create_list(:article, 3))
      render
      expect(rendered).to have_link 'NEW', href: new_article_path
      expect(rendered).to have_link 'WIP', href: articles_path(status: 'wip')
      expect(rendered).to have_link 'ALL', href: articles_path(status: 'all')
    end
  end

  context 'when user is guest' do
    before do
      assign(:articles, create_list(:article, 3))
    end

    it 'does not display admin links' do
      render
      expect(rendered).to_not have_link 'NEW', href: new_article_path
      expect(rendered).to_not have_link 'WIP', href: articles_path(status: 'wip')
      expect(rendered).to_not have_link 'ALL', href: articles_path(status: 'all')
    end

    it 'displays total number of articles' do
      render
      expect(rendered).to have_content '3'
    end
  end
end
