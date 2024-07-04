# app/models/message.rb
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  belongs_to :chat, optional: true

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  validates :content, presence: true
end
