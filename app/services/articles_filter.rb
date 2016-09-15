module ArticlesFilter
  def self.filter_by_status(filter = nil)
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
