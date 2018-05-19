class Book < ApplicationRecord
  validates :author_first, presence: true
  validates :author_last, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: true}

  belongs_to :genre
  has_many :reviews
  has_many :users, through: :reviews

  scope :order_by_title, -> {order("title")}
  scope :order_by_author, -> { order("author_last")}



end
