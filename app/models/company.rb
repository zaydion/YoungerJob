class Company < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  validates :name, :email, :phone_number, :address, :description, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El email introducido debe ser un email válido" },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end
