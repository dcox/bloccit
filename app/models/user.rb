class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }

  has_many :posts
  has_many :comments

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, length: { minimum: 6 }, presence: true, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, length: { minimum: 3, maximum: 100 }, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_secure_password

  enum role: [:member, :admin]
end
