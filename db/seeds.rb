require 'faker'

# Create 10 users
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password'
  )

  # Assign each user some skills (maximum of 10 skills per user)
  rand(1..10).times do
    skill = Skill.create!(
      name: Faker::Job.key_skill,
      # level: rand(1..5),
    #   user: user
    )
  end

  # Each user creates some projects
  rand(1..5).times do
    project = Project.create!(
      title: Faker::Book.title,
      description: Faker::Lorem.paragraphs(number: rand(1..3)).join('\n'),
    #   user: user
    )
  end
end
