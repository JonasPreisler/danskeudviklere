require 'rails_helper'

RSpec.describe Business, type: :model do

  context 'associations' do
    it { should belong_to(:account) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
  
end