class User < ApplicationRecord
  validates :name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :uid, presence: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
