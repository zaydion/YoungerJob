class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :email
      t.string :identification_number
      t.string :phone_number

      t.timestamps
    end
  end
end
