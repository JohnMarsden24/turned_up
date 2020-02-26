class AddDetailsToUsersTable < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :user_name, :string
      #add_column :users, :avatar, :string, default: "v4yr2mopirs85v96tbbc2mxfiarp"
      add_column :users, :artist, :boolean, default: false
      add_column :users, :artist_name, :string
      add_column :users, :location, :string
      add_column :users, :genre, :string
      add_column :users, :price, :integer
      #add_column :users, :photo, :string, default: "../../app/assets/images/default.png"
      add_column :users, :description, :text
  end
end
