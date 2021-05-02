class ApplicationController < ActionController::Base

    def all
        # @photos = Photo.public.where("true") 
        @photos = Photo.all
    end
end
