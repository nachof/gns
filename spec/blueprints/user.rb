class User
  blueprint do
    email                 { Faker::Internet.email }
    full_name             { Faker::Name.name }
    password              { "monkey" }
    password_confirmation { "monkey" }
  end
end
