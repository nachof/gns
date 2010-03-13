class User
  blueprint do
    email     { Faker::Internet.email }
    full_name { Faker::Name.full_name }
  end
end
