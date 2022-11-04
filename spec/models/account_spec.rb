# require 'rails_helper'

# RSpec.describe Account, type: :model do

#   context 'validations' do
    
#     it 'can only have 1 business' do
#       account = Account.create(email: 'test@gmail.com', password: 'testtest')
#       business_1 = Business.new(name: 'test company', account_id: account.id)
#       business_2 = Business.new(name: 'test company 2', account_id: account.id)
#       expect { business_1.save }.to change(Business, :count).by(1)
#       expect { business_2.save }.not_to change(Business, :count)

#     end

#     it 'can only have 1 developer' do

#       account = Account.create(email: 'test@gmail.com', password: 'testtest')
#       developer = Developer.new(
#                                 account: account,
#                                 first_name: 'test',
#                                 last_name: 'test',
#                                 title: 'test',
#                                 about: 'test',
#                                 city: 'København'
#                               )

#       expect {developer.save}.to change(Developer, :count).by(1)
#       expect {developer.save}.not_to change(Business, :count)

#     end
#   end

# end