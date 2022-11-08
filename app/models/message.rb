class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :account
  validates_presence_of :content
  after_create { broadcast_append_to conversation, partial: "conversations/messages/show" }
  after_create :send_push_notification
  scope :unread, -> { where(read: false) }

  def send_push_notification
    ActionCable.server.broadcast "locations_channel:#{conversation.participants.where.not(id: account_id).first.id}", {
        referrer: "new-message", content: content.truncate(50),
        conversation_id: conversation_id, message_id: id
      }
  end

  
end
