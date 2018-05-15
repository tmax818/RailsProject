class Book < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true

  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews
end
