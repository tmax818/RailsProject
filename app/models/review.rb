class Review < ApplicationRecord
  validates :content, presence: true, length: {minimum: 140}

  belongs_to :book
  belongs_to :user


end
