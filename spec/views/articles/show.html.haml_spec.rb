require 'rails_helper'

describe 'articles/show.html.haml' do
  context 'when user is authenticated' do
    before do
      user = create :user
      create_session_for user
    end

    it 'displays admin links' do
      assign(:article, create(:article))
      render
      expect(rendered).to have_link 'EDIT'
      expect(rendered).to have_link 'DELETE'
    end
  end

  context 'when user is guest' do
    it 'does not display admin links' do
      assign(:article, create(:article))
      render
      expect(rendered).to_not have_link 'EDIT'
      expect(rendered).to_not have_link 'DELETE'
    end
  end
end
