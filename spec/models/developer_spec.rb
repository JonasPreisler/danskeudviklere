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
    it { should validate_length_of(:first_name).is_at_most(22) }
    it { should validate_length_of(:last_name).is_at_most(22) }
    it { should validate_length_of(:title).is_at_most(42) }

    it 'can only create a city of the constant options' do
      account = Account.create(email: 'test@gmail.com', password: 'testtest')
      invalid_developer = Developer.new(
                                account: account,
                                first_name: 'test',
                                last_name: 'test',
                                title: 'test',
                                about: 'test',
                                city: 'blablabla'
                              )
      valid_developer = Developer.new(
                              account: account,
                              first_name: 'test',
                              last_name: 'test',
                              title: 'test',
                              about: 'test',
                              city: 'København'
                            )
      expect { invalid_developer.save }.to_not change(Developer, :count)
      expect { valid_developer.save }.to change(Developer, :count).by(1)
    end
  end

end