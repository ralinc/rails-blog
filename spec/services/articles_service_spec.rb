require 'rails_helper'

describe ArticlesService do
  describe 'filters articles' do
    before do
      create_list :article, 2
      create_list :wip_article, 2
    end

    it 'all' do
      articles = ArticlesService.articles 'all'
      expect(articles).to eq(Article.all)
    end

    it 'wip' do
      wip_articles = ArticlesService.articles 'wip'
      expect(wip_articles).to eq(Article.wip)
    end

    it 'published' do
      expect(ArticlesService.articles).to eq(Article.published)
    end
  end

  it 'creates article' do
    success, article =
      ArticlesService.create_article(title: 'title', slug: 'slug', content: 'content')

    expect(success).to eq true
    expect(article).to be_persisted
    expect(article.title).to eq('title')
    expect(article.slug).to eq('slug')
    expect(article.content).to eq('content')
  end

  it 'does not create article if validations fail' do
    success, article =
      ArticlesService.create_article(title: '', slug: '', content: '')

    expect(success).to eq false
    expect(article).not_to be_persisted
  end
end
