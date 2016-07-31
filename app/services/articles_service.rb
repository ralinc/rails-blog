module ArticlesService
  def articles(show = nil)
    case show
    when 'all'
      Article.all
    when 'wip'
      Article.wip
    else
      Article.published
    end
  end

  def create_article(params)
    article = Article.new params
    success = article.save
    [success, article]
  end

  module_function :articles, :create_article
end
