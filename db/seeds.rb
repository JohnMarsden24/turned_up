require 'faker'

puts "Deleting all users"

User.destroy_all

puts "Creating new users"

12.times do
  User.create!(
    user_name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "password",
    artist: true,
    artist_name: Faker::Music.band,
    description: Faker::TvShows::Friends.quote,
    location: Faker::Address.city,
    genre: Faker::Music.genre,
    price: rand(50..100),
    photo: "https://9b16f79ca967fd0708d1-2713572fef44aa49ec323e813b06d2d9.ssl.cf2.rackcdn.com/1140x_a10-7_cTC/GH-Band-Playing-jpg-1559750190.jpg")
end

12.times do
  User.create!(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "password",
    artist: false)
end

puts "Users created"
