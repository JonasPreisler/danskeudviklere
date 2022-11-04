require 'rails_helper'

RSpec.describe Conversation, type: :model do

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
    subject = Conversation.create(participant_ids: [@dev_account_1.id, @business_account.id])

  end

  context 'validations' do
    it { should have_many(:messages) }
    it { should validate_presence_of(:participant_ids) }
    it { should validate_uniqueness_of(:participant_ids) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
    it { should validate_presence_of(:participant_ids) }
    it { should allow_value(Array.new([@dev_account_2.id, @business_account.id])).for(:participant_ids) }
    it { should_not allow_value(Array.new([@dev_account_1.id])).for(:participant_ids) }
    it { should_not allow_value(Array.new([@dev_account_1.id, @dev_account_2.id, @business_account.id])).for(:participant_ids) }

    it 'should have one developer-account and one business-account' do
      
      # invalid_conversation = Conversation.new(participant_ids: [@dev_account_1.id, @dev_account_2.id])
      valid_conversation = Conversation.new(participant_ids: [@dev_account_2.id, @business_account.id])

      # expect { invalid_conversation.save }.to_not change(Conversation, :count)
      expect { valid_conversation.save }.to change(Conversation, :count).by(1)
      
    end
  end
end