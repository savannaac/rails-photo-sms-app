class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def all
        @photos = Photo.all.public_photos 
        # @photos = Photo.all.where(:public => "public")
    end

    # def last_photo
    #    @photos = current_user.photos.last
    # end

    def display_last_photo
        # @photos = last_photo.img_url
        @photo = current_user.photos.last
    end
    
    helper_method :display_last_photo

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

