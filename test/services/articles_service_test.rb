require 'test_helper'

class ArticlesServiceTest < ActiveSupport::TestCase
  test 'shows all articles' do
    assert_equal ArticlesService.articles('all'), Article.all
  end

  test 'shows wip articles' do
    assert_equal ArticlesService.articles('wip'), Article.wip
  end

  test 'shows published articles' do
    assert_equal ArticlesService.articles, Article.published
  end

  test 'creates article' do
    success, article = ArticlesService.create_article(title: 'a',
                                                      slug: 'a',
                                                      content: 'b')
    assert success
    assert article.persisted?
  end

  test 'does not create article if validations fail' do
    success, article = ArticlesService.create_article(title: '',
                                                      slug: '',
                                                      content: '')
    assert_not success
    assert_not article.persisted?
  end
end
