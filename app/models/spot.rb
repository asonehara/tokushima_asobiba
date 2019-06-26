class Spot < ApplicationRecord
  belongs_to :category
  
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :address, uniqueness: true
  
  mount_uploader :image1,ImgUploader
  mount_uploader :image2,ImgUploader
  mount_uploader :image3,ImgUploader
  
  has_many :likes
  
  has_many :comments
end
