class Photo < ApplicationRecord
     belongs_to :user
     has_many :likes, dependent: :destroy
     has_many :users_who_liked, through: :likes, source: :user

     validates_presence_of :img_url

     scope :public_photos, -> { where(public: "public") }

     CHOICES = ["public", "private"]  
end
