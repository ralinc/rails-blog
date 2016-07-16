module ApplicationHelper
  MARKDOWN_OPTIONS = {
    filter_html: false,
    hard_wrap: true,
    no_styles: true,
    prettify: true,
    safe_links_only: true,
    link_attributes: { rel: 'nofollow', target: '_blank' },
    with_toc_data: true
  }.freeze

  MARKDOWN_EXTENSIONS = {
    autolink: true,
    fenced_code_blocks: true,
    footnotes: false,
    highlight: true,
    no_images: true,
    no_intra_emphasis: true,
    quote: true,
    space_after_headers: false,
    strikethrough: true,
    superscript: true,
    tables: true,
    underline: true
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
