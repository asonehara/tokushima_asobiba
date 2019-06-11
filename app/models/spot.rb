class Spot < ApplicationRecord
  belongs_to :category
  
  validates :name, presence: true
  
  mount_uploader :image1, ImgUploader
  mount_uploader :image2, ImgUploader
  mount_uploader :image3, ImgUploader
end
