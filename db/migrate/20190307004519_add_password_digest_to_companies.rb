class AddPasswordDigestToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :password_digest, :string
  end
end
