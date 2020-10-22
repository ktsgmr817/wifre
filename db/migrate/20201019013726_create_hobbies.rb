class CreateHobbies < ActiveRecord::Migration[5.1]
  def change
    create_table :hobbies do |t|
      t.string :hobbyname

      t.timestamps
    end
  end
end
