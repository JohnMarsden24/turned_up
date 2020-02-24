class User < ApplicationRecord
  has_many :reviews, class_name: "Review", foreign_key: "user_id"
  has_many :reviewed, class_name: "Review", foreign_key: "artist_id"

  has_many :bookings, class_name: "Booking", foreign_key: "user_id"
  has_many :booked, class_name: "Booking", foreign_key: "artist_id"

  # validates

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
