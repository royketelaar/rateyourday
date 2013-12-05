class AddPlaylistIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :playlist_id, :integer
  end
end
