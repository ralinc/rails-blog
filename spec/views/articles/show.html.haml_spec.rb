require 'rails_helper'

describe 'articles/show.html.haml' do
  let(:article) { ArticleDecorator.new create(:article) }
  let(:user) { create :user }

  context 'when user is authenticated' do
    before do
      sign_in user
    end

    it 'displays admin links' do
      assign(:article, article)

      render

      expect(rendered).to have_link 'EDIT'
      expect(rendered).to have_link 'DELETE'
    end
  end

  context 'when user is guest' do
    it 'does not display admin links' do
      assign(:article, article)

      render

      expect(rendered).to_not have_link 'EDIT'
      expect(rendered).to_not have_link 'DELETE'
    end
  end
end
