class User < ApplicationRecord
  validates :name, presence: true, length: {in: (4..50)}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {in: (10..255)},
          format: {with: VALID_EMAIL_REGEX}


  has_many :reviews
  has_many :books, through: :reviews
end
