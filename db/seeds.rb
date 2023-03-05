require 'faker'

# Create 10 users
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )

  