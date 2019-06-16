class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  validates :star, presence: true 
  validates :content, presence: true, length: { maximum:255}
end
