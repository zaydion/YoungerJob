class User < ApplicationRecord
  # presence
  validates :email, :dob, presence: true
  # format
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  # inclusion
  validates :dob, inclusion: { in: (25.years.ago..16.years.ago), message: "Usuario tiene que tener entre 16 y 25 años de edad" }
  #length
  # validates :first_name, :last_name, length: { minimum: 2 }
end
