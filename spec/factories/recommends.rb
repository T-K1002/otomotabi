FactoryBot.define do
  factory :recommend do
    genre { Faker::Lorem.sentence }
    prefecture { Faker::Address.city }
  end
end
