class ChatroomController < ApplicationController
    before_action :require_user
    before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @message = Message.new
    @messages = Message.custom_display
    @users = User.all.order(:username)
  end
end
