require 'rails_helper'

describe Tag do
  let(:tag) { create :tag }

  it 'returns published articles' do
    create :wip_article, tags: [tag]
    published_article = create :published_article, tags: [tag]

    published_articles = tag.published_articles

    expect(published_articles.size).to eq(1)
    expect(published_articles.first.title).to eq(published_article.title)
  end

  context '(validations)' do
    subject { tag }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
