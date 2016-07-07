require 'test_helper'

class ListArticlesTest < ActionDispatch::IntegrationTest
  test 'lists articles' do
    get articles_path
    assert_response :success
    assert_template 'articles/index'
    assert_match Article.count.to_s, response.body
    Article.all.each do |article|
      assert_select 'a', article.title
    end
  end

  test 'order should be most recent first' do
    assert_equal articles(:most_recent), Article.first
  end
end
