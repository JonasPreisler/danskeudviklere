FactoryGirl.define do

  factory :account do
    sequence(:name)       { |n| "person #{n}"}
    sequence(:email)      { |n| "person#{n}@example.com" }
    password              'foobarfoobar'
    password_confirmation 'foobarfoobar'
    confirmed_at          Time.now
    sequence(:id)         { |n| n }
  end

  # factory :developer do
  #   sequence(:slug)       'test-developer'
  #   sequence(:account_id) 1
  #   sequence(:first_name) 'Test'
  #   sequence(:last_name) 'Developer'
  #   sequence(:title) 'Super boss'
  #   sequence(:about) 'Lorem ipsum'
  #   sequence(:profile_picture) "#{Rails.root}/public/images/avatar.png"
  #   sequence(:role_types) ['fulltime', 'parttime', 'remote']
  #   sequence(:search_status) 0
  #   sequence(:website) 'https://preisler.io'
  # end
end