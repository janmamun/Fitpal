# app/controllers/chats_controller.rb
class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = current_user.sent_chats.or(current_user.received_chats).includes(chat_room: :messages).order('messages.created_at DESC')
    @chat = Chat.new
  end

  def create
    receiver = User.find(chat_params[:receiver_id])
    chat_room = ChatRoom.find_or_create_by(name: "Chat between #{current_user.email} and #{receiver.email}")

    @chat = Chat.find_or_initialize_by(sender: current_user, receiver: receiver, chat_room: chat_room)

    if @chat.new_record?
      @chat.save!
    end

    message = chat_room.messages.build(content: params[:chat][:message], user: current_user, chat: @chat)
    if message.save
      redirect_to chat_path(@chat)
    else
      render :index
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.chat_room.messages.order(created_at: :asc)
    @message = Message.new
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id, :message)
  end
end
