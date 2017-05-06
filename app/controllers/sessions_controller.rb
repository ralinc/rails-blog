class SessionsController < ApplicationController
  def new
  end

  def create
    if authenticated? || authenticate
      redirect_back
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
