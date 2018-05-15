class User < ApplicationRecord
  validates :name, presence: true, length: {in: (4..50)}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {in: (7..255)},
          format: {with: VALID_EMAIL_REGEX},
          uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  has_many :reviews
  has_many :books, through: :reviews
end
