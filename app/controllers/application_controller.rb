# frozen_string_literal: true

class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

    def logged_in?
    !current_user.nil?
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end

