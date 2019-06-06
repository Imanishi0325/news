class Article < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :text, length: { in: 1..500 } 
end
