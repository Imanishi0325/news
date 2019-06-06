class Article < ApplicationRecord
  belongs_to :user
  validates :text, length: { in: 1..500 } 
end
