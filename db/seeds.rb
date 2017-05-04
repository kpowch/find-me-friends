
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding Data.. .."

## Set ho many users to seed
user_count = 30
i = 0
j = 0

## USERS
puts "Generating some homies..."
User.destroy_all

user_count.times do |i|
  User.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "pizza",
    password_confirmation: "pizza",
    dob: Faker::Date.birthday(18, 35),
    profile_picture: File.open(File.join(Rails.root, '/app/assets/images/no_photo.jpg')),
    bio: Faker::Hipster.sentence(5),
    created_at: Time.now,
    updated_at: Time.now
  })
end

## INTERESTS
puts "Making people enjoy doing things..."
Interest.destroy_all

interest_array = [
  "Knitting",
  "Felting",
  "Cooking",
  "Running",
  "Hiking",
  "Photography",
  "Crafting",
  "Swimming",
  "Dogs",
  "Writing",
  "Wine",
  "Comedy",
  "Yoga",
  "Disc Golf",
  "Coding",
  "Chess"
]

while i < interest_array.count do
  Interest.create(name: interest_array[i])
  i += 1
end

## INTERESTS_USERS
while j < user_count do
  k = 0
  m = rand(1..interest_array.count)
  while k < m do
    InterestsUser.create(user_id: j + 1, interest_id: k + 1)
    k += 1
  end
  j += 1
end


## CHATROOMS
puts "Deleting any conversations..."
Chatroom.destroy_all

# Chatroom.create(friendship_id: 1)
# Chatroom.create(friendship_id: 2)

puts "Seeding Complete!"
