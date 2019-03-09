class AddJobTypeToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :job_type, :string
  end
end
