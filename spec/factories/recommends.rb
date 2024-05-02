FactoryBot.define do
  factory :recommend do
    genre { Faker::Lorem.sentence(word_count: 1) }
    prefecture { Faker::Address.city }
  end
end
