module ArticlesHelper
  MARKDOWN_OPTIONS = {
    filter_html: false,
    hard_wrap: true,
    no_styles: true,
    link_attributes: { rel: 'nofollow', target: '_blank' },
    prettify: true,
    safe_links_only: true,
    with_toc_data: true
  }

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
  }

  def markdown(text)
    renderer = MarkdownRenderer.new(MARKDOWN_OPTIONS)
    markdown = Redcarpet::Markdown.new(renderer, MARKDOWN_EXTENSIONS)
    markdown.render(text).html_safe
  end

  def gravatar_url(email, size)
    gravatar = Digest::MD5.hexdigest(email).downcase
    "//gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
