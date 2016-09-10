module ApplicationHelper
  def page_title(title)
    "#{title} - Ralin Chimev".html_safe
  end

  def referer_path
    URI(request.referer).path
  end
end
