class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :photos
  has_many :likes, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  # def self.from_omniauth(auth)
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   user.name = auth.info.name   # assuming the user model has a name
    #   # If you are using confirmable and the provider(s) you use validate emails, 
    #   # uncomment the line below to skip the confirmation emails.
    #   # user.skip_confirmation!
    # end
  
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name
  #     user.uid = auth.uid
  #   end
  # end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
