class ChangeUsersColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :university, :string

    add_column :users, :birth_place, :integer
  end
end
