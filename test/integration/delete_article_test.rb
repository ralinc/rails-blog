require 'test_helper'

class DeleteArticleTest < ActionDispatch::IntegrationTest
  def setup
    @article = articles(:lorem)
  end

  test 'deletes article' do
    login_as_john
    assert_difference 'Article.count', -1 do
      delete_via_redirect article_path(@article)
    end
    assert_response :success
    assert_equal path, articles_path
  end

  test 'does not delete article if not logged in' do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to login_path
  end
end
