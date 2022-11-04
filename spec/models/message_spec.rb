require 'rails_helper'

RSpec.describe Message, type: :model do

  before(:each) do
    @dev_account_1 = FactoryBot.create(:account)
    @dev_account_2 = FactoryBot.create(:account)
    @business_account = FactoryBot.create(:account)

    [@dev_account_1, @dev_account_2].each do |account|
      Developer.create(
        account_id: account.id,
        first_name: 'test',
        last_name: 'test',
        title: 'test',
        about: 'test',
        city: 'København'
      )
    end

    Business.create(account_id: @business_account.id, name: 'Test')
    conversation = Conversation.create(participant_ids: [@dev_account_1.id, @business_account.id])
    subject = Message.create(conversation: conversation, account: @dev_account_1, content: "test message")
  end
  
  context 'associations' do
    it { should belong_to(:conversation) }
    it { should belong_to(:account) }
  end

  context 'validations' do
    it { should validate_presence_of(:content) }    
  end

end