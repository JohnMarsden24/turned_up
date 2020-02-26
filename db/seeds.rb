require 'faker'
require "open-uri"

puts "Deleting all users"

User.destroy_all

puts "Creating new users..."


2.times do
  alphabet=('a'..'z').to_a
  profile_pic = URI.open("https://api.adorable.io/avatars/285/#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}@adorable.io.png")
  @photo_holder = URI.open("https://consequenceofsound.net/wp-content/uploads/2019/10/Tool-2.jpg?quality=80&w=807")
  @u = User.new(
    user_name: Faker::FunnyName.name,
    email: Faker::Internet.email,
    password: "password",
    artist: true,
    artist_name: Faker::Music.band,
    description: Faker::TvShows::Friends.quote,
    location: Faker::Address.city,
    genre: Faker::Music.genre,
    price: rand(50..100))
  @u.avatar.attach(io: profile_pic, filename: 'avatar.png', content_type: 'image/png')
  @u.photo.attach(io: @photo_holder, filename: 'photo.png', content_type: 'image/png')
  @u.save!
end

2.times do
  alphabet=('a'..'z').to_a
  #profile_pic = URI.open("https://api.adorable.io/avatars/285/#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}#{(alphabet.sample)}@adorable.io.png")
  @u = User.new(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: "password",
    artist: false)
  #@u.avatar.attach(io: profile_pic, filename: 'nes.png', content_type: 'image/png')
  @u.save!
end

puts "Creating new Reviews..."

2.times do
  Review.create!(
    content: Faker::Quote.famous_last_words,
    user: User.all[rand(2..3)],
    rating: rand(1..5),
    artist: User.all[rand(0..1)])
end

puts "Creating new Bookings..."

2.times do
  Booking.create!(
    date: Date.today + rand(0..1),
    user: User.all[rand(2..3)],
    artist: User.all[rand(0..1)])
end

puts "Users, Reviews & Bookings created!"
