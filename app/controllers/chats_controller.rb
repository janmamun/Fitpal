class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.where(sender: current_user).or(Chat.where(receiver: current_user))
    @chat = Chat.new
  end

  def create
    @chat = current_user.sent_chats.build(chat_params)
    if @chat.save
      redirect_to chats_path, notice: 'Message sent.'
    else
      redirect_to chats_path, alert: 'Unable to send message.'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:receiver_id, :message)
  end
end
