class UsersController < ApplicationController
  def show
    @user = current_user
    @user = User.find(params[:id])
  #  @liked_bookmarks = @user.liked_bookmarks
    @user_bookmarks = current_user.bookmarks
    end
end
