require 'rails_helper'

RSpec.describe Project, type: :model do

  context 'associations' do
    it { should have_many(:projects_tools) }
    it { should have_many(:tools).through(:projects_tools) }
    it { should belong_to(:developer) }
  end

  context 'validations' do
    it { should validate_presence_of(:about) }
  end


end