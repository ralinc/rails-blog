require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
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
    assert_difference('Article.count') do
      post :create, article: articles(:lorem).attributes
    end
    assert_redirected_to articles_path
  end

  test 'does not create article without session' do
    post :create, article: { title: 'New', content: 'Sample' }
    assert_redirected_to login_path
  end
end
