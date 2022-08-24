class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    @users = User.all.order(:username)
    SendMessageJob.perform_later(@message)
  end 

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end
