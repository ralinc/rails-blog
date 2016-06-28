module SessionsHelper
  def authenticate
    email = params[:session][:email]
    password = params[:session][:password]
    user = Authenticator.login(email, password)
    session[:user_id] = user.id if user
  end

  def force_login
    return if authenticated?

    redirect_to login_url
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
