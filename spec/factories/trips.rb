FactoryBot.define do
  factory :trip do
    title { Faker::Lorem.sentence(word_count: 1) }
    start_date { "2024/2/1" } 
    end_date { "2024/2/5" }
    prefecture { "北海道" }

    association :group
  end
end
