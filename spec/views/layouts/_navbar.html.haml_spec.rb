require 'rails_helper'

describe 'layouts/_navbar.html.haml' do
  context 'when user is authenticated' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    it 'displays logout button' do
      render
      expect(rendered).to have_link 'Logout', href: destroy_user_session_path
    end
  end

  context 'when user is guest' do
    it 'does not display logout button' do
      render
      expect(rendered).to_not have_link 'Logout', href: destroy_user_session_path
    end
  end
end
