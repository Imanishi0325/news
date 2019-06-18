class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :text, presence: true
  validates :text, length: { in: 1..500 }
end
