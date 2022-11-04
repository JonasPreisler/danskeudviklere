FactoryBot.define do

  factory :account do
    email      { |n| "person#{n}@example.com" }
    password              { 'testtest' }
    trait :developer do
      association :developer, factory: :developer      
    end
    trait :business do
      association :business, factory: :business
    end
  end

  factory :developer do
    association              :account
    sequence(:slug)          {'test-developer'}
    sequence(:first_name)    {'Test'}
    sequence(:last_name)     {'Developer'}
    sequence(:title)         {'Super boss'}
    sequence(:about)         {'Lorem ipsum'}
    sequence(:city)          {'København'}
    # sequence(:profile_picture) "#{Rails.root}/public/images/avatar.png"
    sequence(:role_types)    {['fulltime', 'parttime', 'remote']}
    sequence(:search_status) {0}
    sequence(:website)       {'https://preisler.io'}
  end

  factory :business do
    association              :account
    sequence(:name)          {'Test business'}
  end
end

