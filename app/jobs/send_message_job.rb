class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
      mine = ApplicationController.render(
        partial: 'messages/mine',
        locals: {message: message}
      )

      theirs = ApplicationController.render(
        partial: 'messages/theirs',
        locals: {message: message}
      )

      ActionCable.server.broadcast "chatroom_channel",
                                          {mine: mine, theirs: theirs, message: message}
  end
end
