class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :connections
         has_many :partners, through: :connections
         has_many :sent_chats, class_name: 'Chat', foreign_key: 'sender_id'
         has_many :received_chats, class_name: 'Chat', foreign_key: 'receiver_id'
         has_many :workouts, dependent: :destroy
        end
