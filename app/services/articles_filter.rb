module ArticlesFilter
  extend self

  def run(filter = nil)
    case filter
      when 'all' then Article.all
      when 'wip' then Article.wip
      else Article.published
    end
  end
end
