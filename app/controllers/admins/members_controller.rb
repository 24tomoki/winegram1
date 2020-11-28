class Admins::MembersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @users = User.all
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to admins_index_path
    end
end
