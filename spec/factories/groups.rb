FactoryBot.define do
  factory :group do
    name { Faker::Name.name }
    introduction { Faker::Lorem.sentence(word_count: 1) }

    association :owner
  end
end
