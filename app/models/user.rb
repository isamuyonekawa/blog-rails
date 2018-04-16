class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
  has_secure_password

  has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
end