class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :day
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
