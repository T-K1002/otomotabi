FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    introduction { Faker::Lorem.sentence }

    association :owner
  end
end
