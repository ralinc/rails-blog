require 'rails_helper'

describe SessionsHelper do
  let(:user) { create :user }

  it 'authenticates the user with correct credentials' do
    request_parameters = { session: { email: user.email, password: 'password' } }
    allow(helper).to receive(:params).and_return(request_parameters)
    expect(helper.authenticate).to be_truthy
    expect(session[:user_id]).to be_truthy
  end

  it 'authenticates the user with upcased email' do
    request_parameters = { session: { email: user.email.upcase, password: 'password' } }
    allow(helper).to receive(:params).and_return(request_parameters)
    expect(helper.authenticate).to be_truthy
    expect(session[:user_id]).to be_truthy
  end

  it 'does not authenticate the user with wrong email' do
    request_parameters = { session: { email: 'wrong@example.com', password: 'password' } }
    allow(helper).to receive(:params).and_return(request_parameters)
    expect(helper.authenticate).to be_falsy
    expect(session[:user_id]).to be_falsy
  end

  it 'does not authenticate the user with wrong password' do
    request_parameters = { session: { email: user.email, password: 'pass' } }
    allow(helper).to receive(:params).and_return(request_parameters)
    expect(helper.authenticate).to be_falsy
    expect(session[:user_id]).to be_falsy
  end

  it 'logouts a user' do
    session[:user_id] = user.id
    helper.logout
    expect(session[:user_id]).to be_falsy
  end

  it 'returns the user if authenticated' do
    session[:user_id] = user.id
    expect(helper.current_user).to eq user
  end

  it 'does not return a user if not authenticated' do
    expect(helper.current_user).to be_nil
  end

  it 'tells if the current user is authenticated' do
    session[:user_id] = user.id
    expect(authenticated?).to be_truthy
  end

  it 'tells if the user is not authenticated' do
    expect(authenticated?).to be_falsy
  end
end
