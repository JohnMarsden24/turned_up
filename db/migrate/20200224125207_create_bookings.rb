class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.references :artist, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
