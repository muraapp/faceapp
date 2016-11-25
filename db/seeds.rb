10.times do |n|
    name  = Faker::Name.name
    email = Faker::Internet.email
    content = Faker::Lorem.sentence


    uid = User.create_unique_string
    provider = "facebook"
    password = "password"
    User.create!(name: name,
                email: email,
                uid: uid,
                provider: provider,
                password: password,
                password_confirmation: password)
    user_id = User.last.id

    Topic.create!(user_id: user_id,
                 content: content)
    topic_id = Topic.last.id

    Comment.create!(topic_id: topic_id,
                  user_id: user_id,
                  content: content)

end
