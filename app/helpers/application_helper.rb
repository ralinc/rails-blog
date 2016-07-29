module ApplicationHelper
  def page_title(title)
    "#{title} - Ralin Chimev".html_safe
  end

  def gravatar_url(email, size)
    gravatar = Digest::MD5.hexdigest(email).downcase
    "//gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
