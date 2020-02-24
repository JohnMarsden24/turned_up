class User < ApplicationRecord
  has_many :reviews, class_name: "Review", foreign_key: "user_id", dependent: :destroy
  has_many :reviewed, class_name: "Review", foreign_key: "artist_id", dependent: :destroy

  has_many :bookings, class_name: "Booking", foreign_key: "user_id", dependent: :destroy
  has_many :booked, class_name: "Booking", foreign_key: "artist_id", dependent: :destroy

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :artist_name, :location, :price, :genre, :description, presence: true, if: :artist

  has_many_attached :photos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
