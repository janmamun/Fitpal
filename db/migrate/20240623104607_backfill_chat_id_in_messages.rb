class BackfillChatIdInMessages < ActiveRecord::Migration[7.1]
  def up
    Message.reset_column_information

    Message.find_each do |message|
      chat = Chat.find_by(sender_id: message.user_id) ||
             Chat.find_by(receiver_id: message.user_id)

      if chat.present?
        message.update_columns(chat_id: chat.id)
      end
    end

    change_column_null :messages, :chat_id, false
  end

  def down
    change_column_null :messages, :chat_id, true
  end
end
