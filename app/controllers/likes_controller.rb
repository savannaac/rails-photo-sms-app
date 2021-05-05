class LikesController < ApplicationController
    before_action :find_photos
    before_action :find_likes, only: [:destroy]

    def create
        if already_liked?
            flash.alert = "oops, can't like more than once"
        else
            @photo.likes.create(user_id: current_user.id)
        end

        redirect_to all_path
    end

    def destroy
        if !(already_liked?)
            flash.alert = "oops, can't unlike"
        else
            @like.destroy

            redirect_to all_path
        end
    end

    private
        def like_params
            params.require(:like).permit(:user_id, :photo_id)
        end

        def find_photos
            @photo = Photo.find(params[:photo_id])
        end

        def find_like
            @like = @photo.likes
        end

        def already_liked?
            Like.where(user_id: current_user.id, photo_id: params[:photo_id]).exists?
        end
end