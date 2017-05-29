require 'rails_helper'

describe ApplicationHelper do
  it 'builds a page title' do
    page_title = helper.page_title 'Home'

    expect(page_title).to eq('Home - Ralin Chimev')
  end

  it 'builds a gravatar image url' do
    url = helper.gravatar_url 'admin@example.com', 32

    expect(url).to eq('//gravatar.com/avatar/e64c7d89f26bd1972efa854d13d7dd61.png?s=32')
  end
end
