class Photo < ApplicationRecord
     belongs_to :user
     has_many :likes, dependent: :destroy
     has_many :users_who_liked, through: :likes, source: :user

     validates :img_url, presence: true
     validates :public, presence: true

     scope :public_photos, -> { where(public: "public") }

     CHOICES = ["public", "private"]  
end
