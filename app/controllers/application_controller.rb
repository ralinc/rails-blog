class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  protected

  def ssl?
    Settings.ssl
  end

  def force_authentication
    return if authenticated?
    store_return_to_url
    redirect_to login_url
  end

  def redirect_back
    redirect_to return_to_url || root_url
    clear_return_to_url
  end

  def return_to_url
    session[:return_to]
  end

  def store_return_to_url
    session[:return_to] = request.original_fullpath if request.get?
  end

  def clear_return_to_url
    session[:return_to] = nil
  end
end
