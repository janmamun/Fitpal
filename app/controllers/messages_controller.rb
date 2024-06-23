# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      # Broadcast the message (assuming you have ActionCable setup)
      MessageBroadcastJob.perform_later(@message)
      redirect_to chat_room_path(@chat_room)
    else
      render 'chat_rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id)
  end
end
