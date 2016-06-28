class SessionsController < ApplicationController
  def new
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
    redirect_to root_path
  end
end
