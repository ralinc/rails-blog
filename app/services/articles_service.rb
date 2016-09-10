module ArticlesService
  def self.filter(show = nil)
    case show
    when 'all'
      Article.all
    when 'wip'
      Article.wip
    else
      Article.published
    end
  end
end
