namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Norman Yu",
                         email: "normanujan@gmail.com",
                         password: "dinami",
                         password_confirmation: "dinami",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      giver_email = Faker::Internet.email
      users.each { |user| user.feedbacks.create!(content: content, giver_email: giver_email) } 
    end
  end
end