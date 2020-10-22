class CreateUserHobbies < ActiveRecord::Migration[5.1]
  def change
    create_table :user_hobbies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :hobby, index: true, foreign_key: true

      t.timestamps
    end
  end
end
