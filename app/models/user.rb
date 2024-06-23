class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :gyms
  has_many :sent_chats, class_name: 'Chat', foreign_key: 'sender_id'
  has_many :received_chats, class_name: 'Chat', foreign_key: 'receiver_id'
  has_many :connections
  has_many :workouts
  has_many :messages
  has_many :chat_rooms, through: :messages
end
