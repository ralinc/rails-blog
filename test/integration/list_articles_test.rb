require 'test_helper'

class ListArticlesTest < ActionDispatch::IntegrationTest
  test 'lists published articles' do
    get articles_path
    assert_response :success
    assert_template 'articles/index'
    assert_match Article.count.to_s, response.body
    Article.published.each do |article|
      assert_select 'a', article.title
    end
  end

  test 'does not list wip articles' do
    get articles_path
    assert_response :success
    assert_template 'articles/index'
    assert_match Article.count.to_s, response.body
    Article.wip.each do |article|
      assert_select 'a', text: article.title, count: 0
    end
  end
end
