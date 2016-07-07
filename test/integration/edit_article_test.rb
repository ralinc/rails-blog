require 'test_helper'

class EditArticleTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:lorem)
  end

  test 'edits article' do
    login_as_john
    get edit_article_path(@article)
    assert_response :success
    patch article_path(@article), article: { title: 'A', content: 'B' }
    assert_redirected_to @article
    @article.reload
    assert_equal 'A', @article.title
    assert_equal 'B', @article.content
  end

  test 'does not edit article if fields are missing' do
    login_as_john
    get edit_article_path(@article)
    assert_response :success
    patch article_path(@article), article: { title: '', content: '' }
    assert_template 'articles/edit'
    @article.reload
    assert_not_equal '', @article.title
    assert_not_equal '', @article.content
  end

  test 'does not edit article if not logged in' do
    get edit_article_path(@article)
    assert_redirected_to login_path
  end
end
