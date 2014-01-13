class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :education, :string
    add_column :users, :employment, :string
    add_column :users, :section, :string
    add_column :users, :function, :string
    add_column :users, :management, :string
    add_column :users, :employees, :integer
    add_column :users, :hours_week, :integer
    add_column :users, :salary, :integer
    add_column :users, :work_location, :string
    add_column :users, :place, :string
  end
end
