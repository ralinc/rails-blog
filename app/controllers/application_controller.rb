class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception

  def ssl_configured?
    Rails.env.production?
  end
end
