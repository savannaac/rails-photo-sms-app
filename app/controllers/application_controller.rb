class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :most_liked_photo

    def all
        @photos = Photo.all.public_photos
        # @photos = Photo.all.where(:public => "public")
    end

    def most_liked_photo
        @liked_photo = all.most_liked.first
        # all.most_liked.first
    end
    # helper_method :most_liked_photo

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

# code challenge: create a route called popular_photo. 
# in this route you are to render the photo with the most likes