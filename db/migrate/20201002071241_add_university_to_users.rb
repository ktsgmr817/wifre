class AddUniversityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :university, :string
  end
end
