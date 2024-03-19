FactoryBot.define do
  factory :spot do
    name { "札幌観光" }
    date { "2024/2/1" }
    start_time { "7:00" }
    end_time { "8:00" }
    prefecture { "北海道" }

    association :trip
  end
end
