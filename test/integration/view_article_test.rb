require 'test_helper'

class ViewArticleTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:lorem)
  end

  test 'views article as guest user' do
    get article_path(@article)
    assert_response :success
    assert_template 'articles/show'
    assert_select 'title', "#{@article.title} - Ralin Chimev"
    assert_select 'a', 'BACK'
    assert_select 'a', text: 'EDIT', count: 0
    assert_select 'a', text: 'DELETE', count: 0
    assert_select 'h1', @article.title
    assert_select 'p', @article.content
  end

  test 'views article as logged in user' do
    login_as_john
    get article_path(@article)
    assert_response :success
    assert_template 'articles/show'
    assert_select 'title', "#{@article.title} - Ralin Chimev"
    assert_select 'a', 'BACK'
    assert_select 'a', 'EDIT'
    assert_select 'a', 'DELETE'
    assert_select 'h1', @article.title
    assert_select 'p', @article.content
  end
end
