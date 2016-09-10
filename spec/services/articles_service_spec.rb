require 'rails_helper'

describe ArticlesService do
  describe 'filters articles' do
    before do
      create_list :article, 2
      create_list :wip_article, 2
    end

    it 'all' do
      articles = ArticlesService.filter 'all'
      expect(articles).to eq(Article.all)
    end

    it 'wip' do
      wip_articles = ArticlesService.filter 'wip'
      expect(wip_articles).to eq(Article.wip)
    end

    it 'published' do
      expect(ArticlesService.filter).to eq(Article.published)
    end
  end
end
