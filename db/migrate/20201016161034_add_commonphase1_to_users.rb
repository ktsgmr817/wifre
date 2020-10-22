class AddCommonphase1ToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birth_place, :string
    add_column :users, :commonclass1, :string
    add_column :users, :commonclass2, :string
    add_column :users, :commonclass3, :string
    add_column :users, :commonclass4, :string
    add_column :users, :commonclass5, :string
  end
end
