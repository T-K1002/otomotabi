FactoryBot.define do
  factory :permit do
    association :user
    association :group
  end
end
