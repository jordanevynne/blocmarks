class UsersController < ApplicationController
  def show
    @user = current_user
  #  @liked_bookmarks = @user.liked_bookmarks
    @user_bookmarks = current_user.bookmarks
    end
end
