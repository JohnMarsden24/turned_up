class AddSpotifyLinkToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spotify_link, :string
  end
end
