class ChatroomController < ApplicationController
    before_action :require_user, except: [:show, :index]


  def index
    @message = Message.new
    @messages = Message.all
  end
end
