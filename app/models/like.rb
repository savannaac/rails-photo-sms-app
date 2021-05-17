class Like < ApplicationRecord
    belongs_to :user
    belongs_to :photo, :counter_cache => true

    validates :user_id, uniqueness: { scope: :photo_id }

    # scope :likes_count, -> {
    #     select("photos.*, COUNT(likes.photo_id) AS likes_count")
    #     .joins(:likes)
    #     .group("photos.id")
    #     .order("likes_count DESC")
    # }

    # scope :popular_photo, -> { select ("photo_id, count(photo_id) as count").group(:photo_id).order("count DESC").limit(3) }

    CHOICES = ["like", "super like"]  
end