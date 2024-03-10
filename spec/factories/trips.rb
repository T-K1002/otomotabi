FactoryBot.define do
  factory :trip do
    title { "北海道" }
    start_date { "2024/2/1" } 
    end_date { "2024/2/5" }

    association :group
  end
end
