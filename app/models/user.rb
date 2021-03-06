class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :name,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :uid, uniqueness: true, allow_nil: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
