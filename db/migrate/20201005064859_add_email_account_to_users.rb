class AddEmailAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email_account, :string
  end
end
