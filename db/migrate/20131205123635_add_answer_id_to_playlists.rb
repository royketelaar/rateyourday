class AddAnswerIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :answer_id, :integer
  end
end
