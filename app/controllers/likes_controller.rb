class LikesController < ApplicationController
    
    def index
        @likes = current_user.likes
    end
    
    def create
        @like = current_user.likes.create(wine_id: params[:wine_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @like = Like.find_by(wine_id: params[:wine_id], user_id: current_user.id)
        @like.destroy
        redirect_back(fallback_location: root_path)
    end
end
