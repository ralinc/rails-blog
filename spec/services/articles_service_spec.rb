require 'rails_helper'

describe ArticlesFilter do
  describe 'filters articles' do
    before do
      create_list :article, 2
      create_list :wip_article, 2
    end

    it 'all' do
      articles = ArticlesFilter.apply 'all'
      expect(articles).to eq(Article.all)
    end

    it 'wip' do
      wip_articles = ArticlesFilter.apply 'wip'
      expect(wip_articles).to eq(Article.wip)
    end

    it 'published' do
      expect(ArticlesFilter.apply).to eq(Article.published)
    end
  end
end
