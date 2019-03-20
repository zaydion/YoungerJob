class Post < ApplicationRecord
  belongs_to :company

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  validates :title, presence: { message: "Título es requeridos" }
  validates :description, presence: { message: "Descripción es requeridos" }
  validates :tag_ids, presence: { message: "Debe elegir al menos un interés" }

  def self.younger_job_types
    ['pasantia', 'trabajo de verano']
  end

  def self.older_job_types
    ['pasantia', 'part time', 'full time']
  end

  def self.all_job_types
    Post.younger_job_types + Post.older_job_types
  end

  def self.younger_jobs
    Post.select { |post| Post.younger_job_types.include?(post.job_type) }
  end
  
  def self.older_jobs
    Post.select { |post| Post.older_job_types.include?(post.job_type) }
  end
end
