# app/models/chat_room.rb
class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :chats
end
