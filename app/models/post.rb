class Post < ApplicationRecord
  belongs_to :company

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :title, :description, presence: true
  validates :tag_ids, presence: { message: "Debe elegir al menos un interés" }
end
