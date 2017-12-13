class MessagesController < ApplicationController
  def create
    user = User.find(1)
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.user.username
    end
end
