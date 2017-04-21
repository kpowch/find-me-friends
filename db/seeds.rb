# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data.. .."

# Starting Seeds

## FRIENDSHIPS
puts "Making friends come together...."
Friendship.destroy_all

Friendship.create(id: 1, user_id: 1, friend_id: 2, friendship_status: "Accepted")
Friendship.create(id: 2, user_id: 3, friend_id: 4, friendship_status: "Pending")
Friendship.create(id: 3, user_id: 5, friend_id: 6, friendship_status: "Accepted")

## INTERESTS
puts "Making people enjoy doing things..."
Interest.destroy_all

Interest.create(id: 1, name: Faker::Team.sport)
Interest.create(id: 2, name: Faker::Team.sport)
Interest.create(id: 3, name: Faker::Team.sport)
Interest.create(id: 4, name: Faker::Team.sport)
Interest.create(id: 5, name: "Felting")
Interest.create(id: 6, name: "Food")

## USERS
puts "Generating some homies..."
User.destroy_all

## LOCATIONS
puts "Finding Middle Earth Locations..."
Location.destroy_all

Location.create(id: 1, city: "Victoria", province: "BC", country: "Canada")
Location.create(id: 2, city: "Vancouver", province: "BC", country: "Canada")
Location.create(id: 3, city: "Kelowna", province: "BC", country: "Canada")
Location.create(id: 4, city: "Banff", province: "AB", country: "Canada")

User.create({
  id: 1,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })

User.create({
  id: 2,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })

User.create({
  id: 3,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })

User.create({
  id: 4,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })

User.create({
  id: 5,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })
User.create({
  id: 6,
  location_id: Faker::Number.between(1, 4),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  dob: Faker::Date.birthday(18, 35),
  bio: Faker::Hipster.sentences(1)
  })



puts "Seeding Complete!"
