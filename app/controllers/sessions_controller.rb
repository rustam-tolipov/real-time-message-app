class SessionsController < ApplicationController

  def new
  end

  def create
    if user && user.authenticated(params[:sessions][:password])
      flash[:success] = 'You have successfully logged in.'
      redirect_to user_path(user)
      session[:user_id] = user.id
    else
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
  end
end
