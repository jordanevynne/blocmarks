class UsersController < ApplicationController
  def show
    @user = current_user
    @liked_bookmarks = current_user.likes
    @user_bookmarks = current_user.bookmarks
  end
end
