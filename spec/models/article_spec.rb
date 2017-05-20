require 'rails_helper'

describe Article do
  it 'order is by date descending' do
    create :article, title: 'first', created_at: 1.day.ago, date: 1.day.ago
    create :article, title: 'second', created_at: 2.days.ago, date: DateTime.current

    expect(Article.first.title).to eq('second')
  end

  it 'url is built based on slug' do
    article = create :article

    expect(article.to_param).to eq article.slug
  end

  it 'deserializes tags from a comma-separated string' do
    article = build :article, tags_string: 'abc, xyz'

    expect(article.tags.map(&:name)).to eq %w(abc xyz)
  end

  it 'serializes tags to a comma-separated string' do
    tag_abc = build :tag, name: 'abc'
    tag_xyz = build :tag, name: 'xyz'

    article = build :article, tags: [tag_abc, tag_xyz]

    expect(article.tags_string).to eq 'abc, xyz'
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
    it { should validate_presence_of(:title) }

    %w(a aaa a-a aaa-aaa aaa-aaa-aaa).each do |slug|
      it { should allow_value(slug).for(:slug) }
    end

    %w(A Aaa a\ a aa"aa aa'aa 1 123 abc-123 1\ 2 aa?11 aa!11 aa.11).each do |slug|
      it { should_not allow_value(slug).for(:slug) }
    end
  end
end
