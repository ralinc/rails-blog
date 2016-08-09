require 'rails_helper'

describe ApplicationHelper do
  it 'should return page title' do
    page_title = helper.page_title 'Home'
    expect(page_title).to eq('Home - Ralin Chimev')
  end
end
