class Company < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, :email, :phone_number, :address, :description, presence: true
end
