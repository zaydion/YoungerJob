class RemoveIdentificationNumberFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :identification_number, :string
  end
end
