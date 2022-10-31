require 'rails_helper'

RSpec.describe Tool, type: :model do

  context 'associations' do
    it { should have_many(:projects_tools) }
    it { should have_many(:projects).through(:projects_tools) }
  end

end