module ApplicationHelper
  MARKDOWN_OPTIONS = {
    filter_html: true,
    link_attributes: { rel: 'nofollow', target: '_blank' },
    space_after_headers: true,
    fenced_code_blocks: true
  }.freeze

  MARKDOWN_EXTENSIONS = {
    autolink: true,
    superscript: true,
    disable_indented_code_blocks: true
  }.freeze

  def gravatar_url(email, size)
    gravatar = Digest::MD5.hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(MARKDOWN_OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, MARKDOWN_EXTENSIONS)
    markdown.render(text).html_safe
  end
end
