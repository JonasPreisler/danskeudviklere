class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :accounts_conversations, dependent: :destroy
  has_many :accounts, through: :accounts_conversations
  validates_presence_of   :participant_ids, :slug
  validates_uniqueness_of :participant_ids, :slug
  validates_length_of     :participant_ids, is: 2
  before_validation       :create_slug
  after_create            :create_join_accounts_conversations
  # validate              :should_have_a_developer_account_and_business_account
  extend FriendlyId
  friendly_id :slug, use: :slugged

  accepts_nested_attributes_for :messages

  scope :ordered_by_recent_first, -> { includes(:messages).order('messages.created_at desc') }

  def participants
    Account.where(id: participant_ids)
  end

  def business
    participants.first.business
  end

  def developer
    participants.second.developer
  end

  def self.unread_messages(account)
    Message.unread.includes(:conversation)
      .where(conversation: {id: account.conversations.ids})
      .where.not(account: account)
  end

  def set_messages_to_read(account)
    messages.unread.where.not(account: account).update_all(read: true)
  end

  private

  def create_join_accounts_conversations
    participants.each do |participant|
      AccountsConversation.create(conversation: self, account: participant)
    end
  end

  def create_slug
    slug = [*('a'..'z'),*('0'..'9')].shuffle[0,12].join
    if Conversation.where(slug: slug).any?
      slug = [*('a'..'z'),*('0'..'9')].shuffle[0,12].join
    end
    self.slug = slug
  end


  
  # def should_have_a_developer_account_and_business_account
    # if participant_ids.present? && participant_ids.size == 2
    #   account1 = Account.find(participant_ids.first)
    #   account2 = Account.find(participant_ids.second)
    #   unless account1.developer && account2.business
    #     errors.add(:base, I18n.t('activerecord.models.validations.conversation.should_have_a_developer_account_and_business_account'))
    #   end
    # end
  # end

  def self.exist?(account, developer)
    ids = [account.id, developer.account_id]
    Conversation.exists?(participant_ids: ids)
  end
end
