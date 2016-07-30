require 'test_helper'

class EditArticleTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:published)
  end

  test 'edits article' do
    login_as_john
    get edit_article_path(@article)
    assert_response :success
    patch article_path(@article), article: { title: 'a',
                                             content: 'b',
                                             slug: 'c' }
    @article.reload
    assert_redirected_to @article
    assert_equal 'a', @article.title
    assert_equal 'b', @article.content
    assert_equal 'c', @article.slug
  end

  test 'does not edit article if fields are missing' do
    login_as_john
    get edit_article_path(@article)
    assert_response :success
    patch article_path(@article), article: { title: '', content: '', slug: '' }
    assert_template 'articles/edit'
    @article.reload
    assert_not_equal '', @article.title
    assert_not_equal '', @article.content
    assert_not_equal '', @article.slug
  end

  test 'does not edit article if not logged in' do
    get edit_article_path(@article)
    assert_redirected_to login_path
  end
end
