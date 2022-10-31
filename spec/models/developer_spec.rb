require 'rails_helper'

RSpec.describe Developer, type: :model do

  context 'associations' do
    it "has many programming_languages" do
      should respond_to(:programming_languages)
    end
    it "has many experiences" do
      should respond_to(:experiences)
    end
    it 'should belong to account' do
      dev = Developer.reflect_on_association(:account)
      expect(dev.macro).to eq(:belongs_to)    
    end
  end
end