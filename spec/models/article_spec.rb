require 'rails_helper'

describe Article do
  it 'to_param should return id-slug' do
    article = create :article
    expect(article.to_param).to eq("#{article.id}-#{article.slug}")
  end

  it 'order should be most recent first' do
    create_list :article, 2
    create :article, title: 'most recent'
    expect(Article.first.title).to eq('most recent')
  end

  describe 'validations' do
    it 'should be valid' do
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
      it 'should be present' do
        article = build :article, slug: ''
        expect(article).not_to be_valid
      end

      it 'should be unique' do
        existing_article = create :article
        new_article = build :article, slug: existing_article.slug
        expect(new_article).not_to be_valid
      end

      it 'should accept valid formats' do
        %w(a aaa a-a aaa-aaa aaa-aaa-aaa 1 111 aaa111 aaa-111).each do |slug|
          article = build :article, slug: slug
          expect(article).to be_valid
        end
      end

      it 'should reject invalid formats' do
        %w(A Aaa a\ a aaa"aaa aaa'aaa 1\ 2 ABC111 aaa?111 aaa!111 aaa.111).each do |slug|
          article = build :article, slug: slug
          expect(article).not_to be_valid
        end
      end
    end
  end
end
