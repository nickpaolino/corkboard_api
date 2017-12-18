class Api::V1::MessagesController < ApplicationController
  def index
  end

  def create
    # Create a message entry in Active Record
    message = Message.create(message_params)
    # The room id is the same as the board id because each board has one chatroom
    room_id = message.board_id

    # If the message saves, broadcast to the room channel
    if message.save
      ActionCable.server.broadcast "room_channel_#{room_id}",
                                   content:  message.content,
                                   username: message.user.username
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :board_id)
  end
end
