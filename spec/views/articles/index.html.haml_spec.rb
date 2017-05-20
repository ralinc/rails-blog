require 'rails_helper'

describe 'articles/index' do
  let(:articles) do
    articles = create_list :article, 3
    articles.map { |article| ArticleDecorator.new article }
  end

  before do
    assign(:articles, articles)
  end

  it 'shows each article date' do
    article = create :article, date: '2017-05-19 11:49'
    assign(:articles, [ArticleDecorator.new(article)])

    render

    expect(rendered).to have_content('May 19, 2017 11:49')
  end

  context 'when user is authenticated' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    it 'displays admin links' do
      render

      expect(rendered).to have_link 'NEW', href: new_article_path
      expect(rendered).to have_link 'WIP', href: articles_path(status: 'wip')
      expect(rendered).to have_link 'ALL', href: articles_path(status: 'all')
    end
  end

  context 'when user is guest' do
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
