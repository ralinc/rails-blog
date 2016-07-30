require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'is valid' do
    article = Article.new title: 'a', content: 'b', slug: 'c'
    assert article.valid?
  end

  test 'is not valid if title is missing' do
    article = Article.new title: '', content: 'b', slug: 'c'
    assert_not article.valid?
  end

  test 'is not valid if content is missing' do
    article = Article.new title: 'a', content: '', slug: 'c'
    assert_not article.valid?
  end

  test 'is not valid if slug is missing' do
    article = Article.new title: 'a', content: 'b', slug: ''
    assert_not article.valid?
  end

  test 'is not valid if slug is not unique' do
    article = Article.new title: 'a', content: 'b', slug: articles(:lorem).slug
    assert_not article.valid?
  end

  test 'slug validation should accept valid formats' do
    valid_slugs = %w(
      a
      aaa
      a-a
      aaa-aaa
      aaa-aaa-aaa
      1
      111
      aaa111
      aaa-111
    )
    valid_slugs.each do |slug|
      article = Article.new title: 'a', content: 'b', slug: slug
      assert article.valid?
    end
  end

  test 'slug validation should reject invalid formats' do
    invalid_slugs = %w(
      A
      Aaa
      a\ a
      aaa"aaa
      aaa'aaa
      1\ 2
      ABC111
      aaa?111
      aaa!111
      aaa.111
    )
    invalid_slugs.each do |slug|
      article = Article.new title: 'a', content: 'b', slug: slug
      assert_not article.valid?
    end
  end

  test 'to_param returns id-slug' do
    article = articles(:lorem)
    assert_equal "#{article.id}-#{article.slug}", article.to_param
  end

  test 'order should be most recent first' do
    assert_equal articles(:most_recent), Article.first
  end
end
