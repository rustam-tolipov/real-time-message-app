class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Chat Room #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to signup_path
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_same_user
    if current_user != @user 
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to root_path
    end
  end
end
