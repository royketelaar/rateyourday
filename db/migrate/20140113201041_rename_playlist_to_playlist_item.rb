class RenamePlaylistToPlaylistItem < ActiveRecord::Migration
  def change
  	rename_table :playlists, :playlist_items
  end
end
