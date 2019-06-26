class User < ApplicationRecord
  validates :name, presence: true, length:{ maximum:50}
  validates :email, presence: true, length: { maximum:255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false}
  has_secure_password
  
  has_many :likes
  has_many :liked_spots, through: :likes, source: :spot #中間テーブルの向こう側のデータを取得するため
   has_many :comments, dependent: :destroy
  has_many :commented_spots, through: :comments, source: :spot
  def like(other_spot)
    self.likes.find_or_create_by(spot_id: other_spot.id)  #お気にいりの重複を防ぐ
  end
  
  def unlike(other_spot)
    like = self.likes.find_by(spot_id: other_spot.id)
    like.destroy if like
  end
  
  def likes?(other_spot)
    self.liked_spots.include?(other_spot)
  end
  
  
end
