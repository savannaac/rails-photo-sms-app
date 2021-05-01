class ApplicationController < ActionController::Base
    def all
        @photos = Photo.public.where("true") 
    end
end
