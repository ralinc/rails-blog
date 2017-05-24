require 'rails_helper'

describe ArticleDecorator do
  it 'renders article markdown as html' do
    article = build :article, content: '**markdown** content *here*'

    html = ArticleDecorator.new(article).html

    expect(html).to eq('<p><strong>markdown</strong> content <em>here</em></p>')
  end

  it 'returns article content preview' do
    article = build :article, content: 'a' * 300

    preview = ArticleDecorator.new(article).content_preview

    expect(preview).to eq("#{'a' * 253}...")
  end
end
