class Booking < ApplicationRecord
  belongs_to :user, class_name: "User", :foreign_key => "user_id"
  belongs_to :artist, class_name: "User", :foreign_key => "artist_id"
  validates :date, uniqueness: { scope: :artist_id}
end
