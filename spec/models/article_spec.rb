require 'rails_helper'

describe Article do
  it 'to_param returns slug' do
    article = create :article
    expect(article.to_param).to eq article.slug
  end

  it 'order is most recent first' do
    create_list :article, 2
    create :article, title: 'most recent'
    expect(Article.first.title).to eq('most recent')
  end

  describe 'validations' do
    it 'is valid' do
      article = build :article
      expect(article).to be_valid
    end

    it 'requires title' do
      article = build :article, title: ''
      expect(article).not_to be_valid
    end

    it 'requires content' do
      article = build :article, content: ''
      expect(article).not_to be_valid
    end

    describe 'slug' do
      it 'is present' do
        article = build :article, slug: ''
        expect(article).not_to be_valid
      end

      it 'is unique' do
        existing_article = create :article
        new_article = build :article, slug: existing_article.slug
        expect(new_article).not_to be_valid
      end

      it 'accepts valid formats' do
        %w(a aaa a-a aaa-aaa aaa-aaa-aaa).each do |slug|
          article = build :article, slug: slug
          expect(article).to be_valid
        end
      end

      it 'rejects invalid formats' do
        %w(A Aaa a\ a aa"aa aa'aa 1 123 abc-123 1\ 2 aa?11 aa!11 aa.11).each do |slug|
          article = build :article, slug: slug
          expect(article).not_to be_valid
        end
      end
    end
  end
end
