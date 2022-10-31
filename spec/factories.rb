FactoryGirl.define do

  factory :account do
    sequence(:name)       { |n| "person #{n}"}
    sequence(:email)      { |n| "person#{n}@example.com" }
    password              'foobarfoobar'
    password_confirmation 'foobarfoobar'
    confirmed_at          Time.now
    sequence(:id)         { |n| n }
  end
end