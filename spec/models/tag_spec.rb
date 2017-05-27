require 'rails_helper'

describe Tag do
  it { should have_many(:taggings) }
  it { should have_many(:articles).through(:taggings) }

  it 'returns only published articles' do
    tag = create :tag
    create :wip_article, tags: [tag]
    published_article = create :published_article, tags: [tag]

    published_articles = tag.published_articles

    expect(published_articles.size).to eq(1)
    expect(published_articles.first.title).to eq(published_article.title)
  end
end
