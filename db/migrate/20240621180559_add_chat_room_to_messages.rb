class AddChatRoomToMessages < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:messages, :chat_room_id)
      add_reference :messages, :chat_room, null: false, foreign_key: true
    end
  end
end
