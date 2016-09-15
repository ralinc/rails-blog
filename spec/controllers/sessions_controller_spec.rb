require 'rails_helper'

describe SessionsController do
  let(:user) { create :user }

  it 'renders login form' do
    get :new
    expect(response).to render_template(:new)
  end

  it 'login page redirects to articles if user is authenticated' do
    create_session_for user
    get :new
    expect(response).to redirect_to(articles_path)
  end

  it 'login form submit redirects to articles if user is authenticated' do
    create_session_for user
    post :create
    expect(response).to redirect_to(articles_path)
  end

  it 'authenticates the user with correct credentials' do
    post :create, session: { email: user.email, password: 'password' }
    expect(session[:user_id]).to be_truthy
    expect(response).to redirect_to(articles_path)
  end

  it 'shows login page when user submits wrong email' do
    post :create, session: { email: 'wrong@example.com', password: 'password' }
    expect(session[:user_id]).to be_falsy
    expect(response).to render_template(:new)
  end

  it 'shows login page when user submits wrong password' do
    post :create, session: { email: user.email, password: 'pass' }
    expect(session[:user_id]).to be_falsy
    expect(response).to render_template(:new)
  end

  it 'logouts the user' do
    create_session_for user
    delete :destroy
    expect(session[:user_id]).to be_falsy
    expect(response).to redirect_to(articles_path)
  end
end
