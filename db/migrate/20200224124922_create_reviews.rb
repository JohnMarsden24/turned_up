class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, index: true, foreign_key: {to_table: :users}
      t.references :artist, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
