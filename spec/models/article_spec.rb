require 'rails_helper'

describe Article do
  it 'order is most recent first' do
    create_list :article, 2
    create :article, title: 'most recent'
    expect(Article.first.title).to eq('most recent')
  end

  it 'id parameter is slug' do
    article = create :article
    expect(article.to_param).to eq article.slug
  end

  it 'creates tags from comma-separated string' do
    article = build :article, tags_string: 'abc, 123, xyz'
    expect(article.tags.map(&:name)).to eq %w(abc 123 xyz)
  end

  it 'returns tags as comma-separated string' do
    tag_abc = build :tag, name: 'abc'
    tag_xyz = build :tag, name: 'xyz'
    article = build :article, tags: [tag_abc, tag_xyz]
    expect(article.tags_string).to eq 'abc, xyz'
  end


  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).case_insensitive }

    %w(a aaa a-a aaa-aaa aaa-aaa-aaa).each do |slug|
      it { should allow_value(slug).for(:slug) }
    end

    %w(A Aaa a\ a aa"aa aa'aa 1 123 abc-123 1\ 2 aa?11 aa!11 aa.11).each do |slug|
      it { should_not allow_value(slug).for(:slug) }
    end
  end
end
