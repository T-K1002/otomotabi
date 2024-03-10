FactoryBot.define do
  factory :group do
    name { "グループ1" }
    introduction { "グループ1の紹介文" }

    association :owner
  end
end
