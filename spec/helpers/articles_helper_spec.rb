require 'rails_helper'

describe ArticlesHelper do
  it 'converts markdown to html' do
    html = helper.markdown '**markdown** content *here*'
    expect(html).to eq('<p><strong>markdown</strong> content <em>here</em></p>')
  end

  it 'builds a gravatar url' do
    url = helper.gravatar_url 'admin@example.com', 32
    expect(url).to eq('//gravatar.com/avatar/e64c7d89f26bd1972efa854d13d7dd61.png?s=32')
  end
end
