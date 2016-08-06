class SessionsController < ApplicationController
  force_ssl if: :ssl_configured?, host: Settings.production_hostname

  def new
    redirect_to articles_path if authenticated?
  end

  def create
    if authenticated? || authenticate
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to articles_path
  end
end
