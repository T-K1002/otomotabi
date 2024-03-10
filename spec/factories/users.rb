FactoryBot.define do
  factory :user, aliases: [:owner] do
    email { "111@222" }
    password { "111111" }

    initialize_with { User.find_or_create_by(email: email)}
  end
end
