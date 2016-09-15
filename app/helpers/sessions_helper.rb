module SessionsHelper
  def authenticate
    email = params[:session][:email]
    password = params[:session][:password]
    user = User.find_by(email: email.downcase)
    return unless user && user.authenticate(password)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticated?
    current_user.present?
  end
end
