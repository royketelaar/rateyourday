class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :scale_id
      t.string :question

      t.timestamps
    end
  end
end
