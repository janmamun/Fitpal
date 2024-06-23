class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.where(sender: current_user).or(Chat.where(receiver: current_user))
    @chat = Chat.new(receiver_id: default_receiver_id)
  end

  def create
    Rails.logger.debug("Chat Params: #{params.inspect}")
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

  def default_receiver_id
    # Logic to determine default receiver_id, e.g. current_user's friend, first user in the database, etc.
    # Example:
    User.first.id
  end
end
