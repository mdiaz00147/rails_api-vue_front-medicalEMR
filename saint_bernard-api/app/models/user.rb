class User < ApplicationRecord
  enum rol: [:admin]

  # callbacks
  before_create :generate_uuid
  before_save   :downcase_attributes

  # validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :email, format: { with: VALID_EMAIL_REGEX  }
  validates :password, presence: true, length: { in: 6..20 }, allow_nil: true
  
  # associations
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/img/anon_user.png'
  do_not_validate_attachment_file_type :avatar

  private
    def generate_uuid
      self.uuid = SecureRandom.uuid
    end

    def downcase_attributes
      self.email  = self.email.downcase if self.email
      self.first_name  = self.first_name.downcase if self.first_name
      self.last_name   = self.last_name.downcase if self.last_name
    end
end
