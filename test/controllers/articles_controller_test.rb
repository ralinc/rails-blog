require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:lorem)
  end

  test 'gets articles' do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:articles)
  end

  test 'new article with session' do
    login_as :john
    get :new
    assert_response :success
    assert_template :new
  end

  test 'new article without session' do
    get :new
    assert_redirected_to login_path
  end

  test 'creates article with session' do
    login_as :john
    assert_difference 'Article.count', 1 do
      post :create, article: @article.attributes
    end
    assert_redirected_to articles_path
  end

  test 'does not create article without session' do
    post :create, article: @article.attributes
    assert_redirected_to login_path
  end

  test 'shows article' do
    get :show, id: @article.id
    assert_response :success
    assert_template :show
    assert_not_nil assigns(:article)
  end

  test 'shows articles page if article is not found' do
    get :show, id: 'not_found'
    assert_redirected_to articles_path
  end

  test 'redirects destroy when not logged in' do
    assert_no_difference 'Article.count' do
      delete :destroy, id: @article.id
    end
    assert_redirected_to login_path
  end

  test 'deletes article when logged in' do
    login_as :john
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article.id
    end
    assert_redirected_to articles_path
  end
end
