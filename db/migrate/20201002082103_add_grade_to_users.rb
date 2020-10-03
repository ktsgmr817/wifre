class AddGradeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :grade, :integer
    add_column :users, :faculty, :string
    add_column :users, :department, :string
  end
end
