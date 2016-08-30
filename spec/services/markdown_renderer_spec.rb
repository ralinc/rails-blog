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
end
