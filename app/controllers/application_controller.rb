class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def all
        @photos = Photo.all.public_photos 
        # @photos = Photo.all.where(:public => "public")
    end

    # def photo
    #     @most_liked = Like.popular_photo
    # end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

# code challenge: create a route called popular_photo. 
# in this route you are to render the photo with the most likes