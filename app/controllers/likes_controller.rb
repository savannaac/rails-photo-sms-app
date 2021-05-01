class LikesController < ApplicationController
    before_action :find_photos
    before_action :find_likes, only: [:destroy]

    def create
        if already_liked?
            flash.alert = "oops, can't like more than once"
        else
            @photo.likes.create(like_params)
        end

        redirect_to photo_path(@like.photo_id)
    end

    def destroy
        @like.destroy

        redirect_to photo_pah(@photo)
    end

    private
        def like_params
            params.require(:like).permit(:user_id, :photo_id)
        end

        def find_photos
            @photo = Photo.find(params[:photo_id])
        end

        def find_like
            @like = @photo.likes.find(params[:id])
        end

        def already_liked?
            Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
        end
end