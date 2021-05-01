class PhotosController < ApplicationController
    before_action :find_photos, only: [:show, :edit, :update, :destroy]

    def index
        @photos = current_user.photos
    end

    def all
       @photos = Photo.public.where("true") 
    end

    def new
       @photo = Photo.new
    end
    
    def create
        @photo = current_user.photos.build(photo_params)
        @photo.user_id = current_user.id
        
        if @photo.save
            flash.notice = "upload successful"

            redirect_to root_path 
        else
            redirect_to root_path
        end
    end

    def show
        # find_photos
    end

    def edit
        # find_photos
    end

    def update
        if @photo.update(photo_params)

            redirect_to photo_path(@photo)
        else
            render :edit
        end
    end

    def destroy
        @photo.destroy
    
        redirect_to user_photos_path
    end

    def like
        find_photos

        Like.create(user_id: current_user.id, photo_id: @photo.id)

        redirect_to photo_path(@photo)
    end

    private 

        def find_photos
            @photo = Photo.find(params[:id])
        end

        def photo_params
            params.require(:photo).permit(:img_url, :user_id)
        end
end