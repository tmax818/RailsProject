class Book < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true

  #belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :reviews

end
