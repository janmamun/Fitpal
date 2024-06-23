class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(content: data['message'], user: current_user, chat_room_id: params[:chat_room_id])
    MessageBroadcastJob.perform_later(message)
  end
end
