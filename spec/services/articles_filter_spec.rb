require 'rails_helper'

describe ArticlesFilter do
  describe 'filters articles' do
    before do
      create_list :article, 2
      create_list :wip_article, 2
    end

    it 'returns all articles' do
      articles = ArticlesFilter.run 'all'
      expect(articles).to eq(Article.all)
    end

    it 'returns only WiP articles' do
      wip_articles = ArticlesFilter.run 'wip'
      expect(wip_articles).to eq(Article.wip)
    end

    it 'returns only published articles' do
      expect(ArticlesFilter.run).to eq(Article.published)
    end
  end
end
