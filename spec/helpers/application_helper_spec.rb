require 'rails_helper'

describe ApplicationHelper do
  it 'returns page title' do
    page_title = helper.page_title 'Home'
    expect(page_title).to eq('Home - Ralin Chimev')
  end

  it 'returns referer path' do
    allow(helper.request).to receive(:referer).and_return('http://www.ralin.net/about')
    expect(helper.referer_path).to eq('/about')
  end
end
