require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  test 'creates article' do
    login_as_john
    get new_article_path
    assert_response :success
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: { title: 'A', content: 'B' }
    end
  end

  test 'does not create article with empty fields' do
    login_as_john
    get new_article_path
    assert_response :success
    assert_no_difference 'Article.count' do
      post articles_path, article: { title: '', content: '' }
    end
    assert_template 'articles/new'
  end

  test 'does not create article if not logged in' do
    get new_article_path
    assert_redirected_to login_path
  end
end
