require 'faker'

puts "Deleting all users"

User.destroy_all

puts "Creating new users..."

12.times do
  alphabet=('a'..'z').to_a
  profile_pic = "https://api.adorable.io/avatars/285/#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}@adorable.io.png"
  User.create!(
    user_name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "password",
    artist: true,
    avatar: profile_pic,
    artist_name: Faker::Music.band,
    description: Faker::TvShows::Friends.quote,
    location: Faker::Address.city,
    genre: Faker::Music.genre,
    price: rand(50..100),
    photo: "https://9b16f79ca967fd0708d1-2713572fef44aa49ec323e813b06d2d9.ssl.cf2.rackcdn.com/1140x_a10-7_cTC/GH-Band-Playing-jpg-1559750190.jpg")
end

12.times do
  alphabet=('a'..'z').to_a
  profile_pic = "https://api.adorable.io/avatars/285/#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}@adorable.io.png"
  User.create!(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    avatar: profile_pic,
    password: "password",
    artist: false)
end

puts "Creating new Reviews..."

20.times do
  Review.create!(
    content: Faker::Quote.famous_last_words,
    user: User.all[rand(12..23)],
    rating: rand(1..5),
    artist: User.all[rand(0..11)])
end

puts "Creating new Bookings..."

20.times do
  Booking.create!(
    date: Date.today + rand(0..15),
    user: User.all[rand(12..23)],
    artist: User.all[rand(0..11)])
end

puts "Users, Reviews & Bookings created!"
