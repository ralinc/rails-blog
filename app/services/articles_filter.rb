module ArticlesFilter
  def self.apply(filter = nil)
    case filter
    when 'all'
      Article.all
    when 'wip'
      Article.wip
    else
      Article.published
    end
  end
end
