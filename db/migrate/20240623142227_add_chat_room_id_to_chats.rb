class AddChatRoomIdToChats < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :chat_room, foreign_key: true, index: true
  end
end
