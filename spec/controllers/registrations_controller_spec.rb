require 'rails_helper'

describe RegistrationsController do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  it 'first user sees registration page' do
    get :new

    expect(response).to render_template(:new)
  end

  it 'second user is redirected to login page' do
    create :user

    get :new

    expect(response).to redirect_to(new_user_session_path)
  end

  it 'first user registration succeeds' do
    expect { register_new_user }.to change(User, :count).by(1)
  end

  it 'second user registration fails' do
    create :user

    expect { register_new_user }.to_not change(User, :count)
  end

  def register_new_user
    user = build :user
    post :create, params: {user: {email: user.email,
                                  password: user.password,
                                  password_confirmation: user.password}}
  end
end
