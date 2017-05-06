class RegistrationsController < Devise::RegistrationsController
  before_action :one_user_registered?, only: [:new, :create]

  protected

  def one_user_registered?
    redirect_to new_user_session_path if User.count == 1
  end
end
