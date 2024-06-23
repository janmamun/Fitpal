# app/models/chat.rb
class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :chat_room

  has_many :messages, dependent: :destroy

  validates :sender, presence: true
  validates :receiver, presence: true
  validates :chat_room, presence: true
end
