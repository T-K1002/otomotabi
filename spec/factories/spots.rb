FactoryBot.define do
  factory :spot do
    memo { Faker::Lorem.sentence(word_count: 3) }
    date { "2024/2/3" }
    start_time { "7:00" }
    end_time { "8:00" }
    address { "札幌駅" }
    prefecture { "北海道" }

    association :trip
  end
end
