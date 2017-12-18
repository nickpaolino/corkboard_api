class RoomChannel < ApplicationCable::Channel
  def subscribed
    room_number = params[:room]
    stream_from "room_channel_#{room_number}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
