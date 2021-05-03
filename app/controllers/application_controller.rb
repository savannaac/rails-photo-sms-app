class ApplicationController < ActionController::Base
    
    def all 
        @photos = Photo.all.where(:public => "public")
    end
end
