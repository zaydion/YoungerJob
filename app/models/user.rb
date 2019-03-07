class User < ApplicationRecord
  # presence
  validates :email, presence: { message: "Email es requerido" }
  validates :dob, presence: { message: "Se requiere fecha de nacimiento" }
  validates :tag_ids, presence: { message: "Debe elegir al menos un interés" }
  # format
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "El email introducido debe ser un email válido" } 
  # validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  # inclusion
  validates :dob, inclusion: { in: (25.years.ago..16.years.ago), message: "Usuario tiene que tener entre 16 y 25 años de edad" }
  #length
  # validates :first_name, :last_name, length: { minimum: 2 }
  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags
  has_secure_password
  before_save { self.email = email.downcase }

end
