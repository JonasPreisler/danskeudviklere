require 'rails_helper'

RSpec.describe ProjectsTool, type: :model do

  context 'associations' do
    it { should belong_to(:tool) }
    it { should belong_to(:project) }
  end

end