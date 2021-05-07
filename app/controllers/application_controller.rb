class ApplicationController < ActionController::Base

    def all 
        @photos = Photo.all.where(:public => "public")
    end

    # def last_photo
    #    @photos = current_user.photos.last
    # end

    def display_last_photo
        # @photos = last_photo.img_url
        @photo = current_user.photos.last
    end
    
    helper_method :display_last_photo
end
