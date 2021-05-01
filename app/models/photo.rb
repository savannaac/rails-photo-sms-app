class Photo < ApplicationRecord
     belongs_to :user
     has_many :likes, dependent: :destroy
     has_many :users_who_liked, through: :likes, source: :user

     validates :img_url, presence: true
     # validates :public, presence: true 

     def liked?(user)
          !!self.likes.find{ |like| like.user_id == user.id }
      end
  
end