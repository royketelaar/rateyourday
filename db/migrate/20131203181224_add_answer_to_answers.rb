class AddAnswerToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer, :integer
  end
end
