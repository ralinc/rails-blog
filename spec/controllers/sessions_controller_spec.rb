require 'rails_helper'

describe SessionsController do
  let(:user) { create :user }

  it 'authenticates the user with correct credentials' do
    post :create, params: {session: {email: user.email, password: 'password'}}
    expect(session[:user_id]).to be_truthy
    expect(response).to redirect_to(root_url)
  end

  it 'shows login page when user submits wrong email' do
    post :create, params: {session: {email: 'wrong@example.com', password: 'password'}}
    expect(session[:user_id]).to be_falsy
  end

  it 'shows login page when user submits wrong password' do
    post :create, params: {session: {email: user.email, password: 'pass'}}
    expect(session[:user_id]).to be_falsy
  end

  it 'logouts the user' do
    create_session_for user
    delete :destroy
    expect(session[:user_id]).to be_falsy
    expect(response).to redirect_to(root_url)
  end
end
