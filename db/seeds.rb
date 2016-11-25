10.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.email
    content = Faker::Lorem.sentence
    user_id = n + 1
    topic_id = n + 1
    password = "password"
    User.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)

    Topic.create!(user_id: user_id,
                 content: content)

    Comment.create!(topic_id: topic_id,
                  user_id: user_id,
                  content: content)

end
