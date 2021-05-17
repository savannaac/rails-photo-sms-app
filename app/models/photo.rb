class Photo < ApplicationRecord
     belongs_to :user
     has_many :likes, dependent: :destroy
     has_many :users_who_liked, through: :likes, source: :user

     validates_presence_of :img_url

     scope :public_photos, -> { where(public: "public") }
     scope :most_liked, -> { order("photos.likes_count DESC") }

     CHOICES = ["public", "private"]  
end

# Homework before Monday (contact via Slack)

# no model methods inside views -> helper_method
# code challenge: create a route called popular_photo. 
     # in this route you are to render the photo with the most likes