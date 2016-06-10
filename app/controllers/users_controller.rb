class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @liked_bookmarks = current_user.bookmarks.all
    @user_bookmarks = current_user.bookmarks.all
    end
end
