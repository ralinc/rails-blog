module ArticleFinder
  extend self

  def run(slug)
    article = Article.find_by slug: slug
    article.decorate
  end
end
