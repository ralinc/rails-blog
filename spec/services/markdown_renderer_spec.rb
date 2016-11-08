require 'rails_helper'

describe MarkdownRenderer do
  it 'renders a paragraph' do
    html = MarkdownRenderer.new.paragraph 'Some text'
    expect(html).to eq '<p>Some text</p>'
  end

  it 'renders a note' do
    html = MarkdownRenderer.new.paragraph 'NOTE: Some note'
    expect(html).to eq '<p class="note">Some note</p>'
  end

  it 'highlights syntax of code blocks' do
    html = MarkdownRenderer.new.block_code "```ruby\nputs <<2*2,2\n```", 'ruby'
    expect(html).to start_with("<div class=\"CodeRay\">\n  <div class=\"code\"><pre>")
  end
end
