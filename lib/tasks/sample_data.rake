namespace :db do
  desc "Fill database with sample data"
  
  task populate: :environment do
    User.create!(name: "wangyifu",
                 email: "wangyifu@nibirutech.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@nibirutech.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end 


  task post: :environment do
    Post.create!(name: "Example Post",
                 user_id: "1",
                 content: "This is an example post",
                 types: "topic",
                 reply_at: "")
    10.times do |n|
      name = "Example Post No.#{n+1}"
      content = "This is #{n+1} example post}"
      type = "topic"
      user_id = "1"
      Post.create!(name: name,
                   user_id: user_id,
                   content: content,
                   types: type,
                   reply_at: "")
    end
  end
  
  task reply: :environment do
    40.times do |n|
      content = "This is the No.#{n+1} reply"
      user_id = "#{n+1}"
      post_id = "1"
      Reply.create!(content: content,
                    user_id: user_id,
                    post_id: post_id)
    end
  end
end
