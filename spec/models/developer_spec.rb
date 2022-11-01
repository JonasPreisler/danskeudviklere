require 'rails_helper'

RSpec.describe Developer, type: :model do

  context 'associations' do
    it { should have_many(:projects) }
    # it { should have_many(:developers_languages) }
    # it { should have_many(:languages).through(:developers_languages) }
    it { should belong_to(:account) }
  end

  context 'validations' do
    it { should validate_presence_of(:about) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:search_status) }
    it { should validate_presence_of(:city) }
    
  end

end