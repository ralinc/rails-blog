module ArticlesService
  def articles(show = nil)
    if show == 'all'
      Article.all
    elsif show
      Article.where status: Article.statuses[show.to_sym]
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
