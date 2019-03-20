class Company < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :posts, dependent: :destroy
  validates :name, presence: { message: "Nombre es requerido" } 
  validates :email, presence: { message: "Email es requerido" } 
  validates :phone_number, presence: { message: "Un numero telefonico es requerido" } 
  validates :description, presence: { message: "Descripción es requerido" }
  validates :address, presence: { message: "Dirección es requerido" }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El email introducido debe ser un email válido" },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  has_one_attached :avatar
end
