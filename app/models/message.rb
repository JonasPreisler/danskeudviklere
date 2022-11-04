class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :account
  validates_presence_of :content
  after_create { broadcast_append_to conversation, partial: "conversations/messages/show" }
  after_create :send_push_notification

  def send_push_notification
    ActionCable.server.broadcast "locations_channel:#{conversation.accounts.where.not(id: account_id).first.id}", { referrer: "new-message", content: content.truncate(50), conversation_id: conversation_id, message_id: id }
  end

  def self.read(messages)
    messages.update_all(read: true)
  end
  
end
