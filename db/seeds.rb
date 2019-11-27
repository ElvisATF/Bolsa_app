# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(name: "Example User",email: "xample@railstutorial.org",
#password:              "foobar", password_confirmation: "foobar")



UserEntity.create!(name: "Example User",email: "example@railstutorial.org",
password:              "foobar", password_confirmation: "foobar",admin: true)

50.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
	password = "password"
	User.create!(name: name,
				 email: email,
				 password:password,
				 password_confirmation: password)
end

50.times do |n|
	name = Faker::Name.name
	email = "xample-#{n+1}@railstutorial.org"
	password = "password"
	UserEntity.create!(name: name,
				 email: email,
				 password:password,
				 password_confirmation: password)
end

user_entity = UserEntity.order(:created_at).take(6)
8.times do
	content = Faker::Lorem.sentence(word_count: 5)
	user_entity.each { |user_entity| user_entity.offers.create!(content: content) }
end

#user_entities = UserEntity.all
#user_entity = user_entities.first
#following = user_entities[2..8]
#followers = user_entities[3..4]
#following.each { |followed| user_entity.follow(followed) }
#followers.each { |follower| follower.follow(user_entity) }

#users = User.all
#user = users.first
#following = users[2..50]
#followers = users[3..40]
#following.each { |followed| user.follow(followed) }
#followers.each { |follower| follower.follow(user) }