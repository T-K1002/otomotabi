FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { Faker::Name.name }
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    password_confirmation {password}

    initialize_with { User.find_or_create_by(email: email)}
  end
end
