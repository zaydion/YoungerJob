class User < ApplicationRecord
  # presence
  validates :email, presence: { message: "Email es requerido" }
  validates :dob, presence: { message: "Se requiere fecha de nacimiento" }
  validates :tag_ids, presence: { message: "Debe elegir al menos un interés" }
  #unique
  validates :email, uniqueness: true
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
  has_one_attached :avatar
  has_one_attached :resume

  validate :correct_document_mime_type
  validate :correct_avatar_type

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def age
    ((Time.zone.now - self.dob.to_time) / 1.year.seconds).floor
  end

  def allowed_posts_by_job_type
    if (16..18).include?(self.age)
      Post.includes(:company).younger_jobs
    elsif (18..25).include?(self.age)
      Post.includes(:company).older_jobs
    end
  end

  def matches
    allowed_posts_by_job_type.select do |post| 
      (post.tag_ids & self.tag_ids).any?
    end
  end

  private
  def correct_document_mime_type
    if resume.attached? && !resume.content_type.in?(%w(application/pdf application/zip application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:resume, 'Curriculum debe de ser un pdf o un archivo doc')
    end
  end

  def correct_avatar_type
    if avatar.attached? && !avatar.content_type.in?(%w(jpg jpeg gif png))
      errors.add(:avatar, 'Foto invalido')
    end
  end
end
