class User < ApplicationRecord

  include PgSearch::Model

  has_many :reviews, class_name: "Review", foreign_key: "user_id", dependent: :destroy
  has_many :reviewed, class_name: "Review", foreign_key: "artist_id", dependent: :destroy

  has_many :bookings, class_name: "Booking", foreign_key: "user_id", dependent: :destroy
  has_many :booked, class_name: "Booking", foreign_key: "artist_id", dependent: :destroy

  validates :user_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :artist_name, :location, :price, :genre, :description, presence: true, if: :artist

  has_one_attached :photo
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  pg_search_scope :search_by_everything,
    against: [ :artist_name, :location, :description, :genre ],
    using: {
      tsearch: { prefix: true }
    }

end
