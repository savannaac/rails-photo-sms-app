class Like < ApplicationRecord
    belongs_to :user
    belongs_to :photo, :counter_cache => true

    validates :user_id, uniqueness: { scope: :photo_id }

    # scope :popular_photo, -> { select ("photo_id, count(photo_id) as count").group(:photo_id).order("count DESC").limit(3) }

    CHOICES = ["like", "super like"]  
end