class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wines = @user.wines
  end
  
end
