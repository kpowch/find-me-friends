
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data.. .."

## LOCATIONS
puts "Finding some nice places..."
Location.destroy_all

Location.create(city: "Victoria", province: "BC", country: "Canada")
Location.create(city: "Vancouver", province: "BC", country: "Canada")
Location.create(city: "Kelowna", province: "BC", country: "Canada")
Location.create(city: "Banff", province: "AB", country: "Canada")

## USERS
puts "Generating some homies..."
User.destroy_all

User.create!({
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password_digest: "MOkngwjgnw",
  dob: Faker::Date.birthday(18, 35),
  profile_picture: 'img.jpeg',
  bio: Faker::Hipster.sentences(1),
  created_at: '21-04-2017',
  updated_at: '22-04-2017'
  })

User.create!({
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password_digest: "MOkngwjgnw",
  dob: Faker::Date.birthday(18, 35),
  profile_picture: 'img.jpeg',
  bio: Faker::Hipster.sentences(1),
  created_at: '21-04-2017',
  updated_at: '22-04-2017'
  })

User.create!({
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password_digest: "MOkngwjgnw",
  dob: Faker::Date.birthday(18, 35),
  profile_picture: 'img.jpeg',
  bio: Faker::Hipster.sentences(1),
  created_at: '21-04-2017',
  updated_at: '22-04-2017'
  })

## FRIENDSHIPS
puts "Making friends come together...."
Friendship.destroy_all

Friendship.create(user_id: 1, friend_id: 2, friendship_status: "Accepted")

## INTERESTS
puts "Making people enjoy doing things..."
Interest.destroy_all

Interest.create(name: Faker::Team.sport)
Interest.create(name: Faker::Team.sport)
Interest.create(name: Faker::Team.sport)
Interest.create(name: Faker::Team.sport)
Interest.create(name: "Felting")
Interest.create(name: "Food")


## INTERESTS_USERS
InterestsUser.create(user_id: 1, interest_id: 2)
InterestsUser.create(user_id: 2, interest_id: 1)
InterestsUser.create(user_id: 2, interest_id: 2)
InterestsUser.create(user_id: 2, interest_id: 3)
InterestsUser.create(user_id: 3, interest_id: 2)
InterestsUser.create(user_id: 3, interest_id: 3)
InterestsUser.create(user_id: 3, interest_id: 4)


## CHATROOMS
puts "Generating some forced conversations..."
Chatroom.destroy_all

Chatroom.create()
Chatroom.create()

puts "Seeding Complete!"
