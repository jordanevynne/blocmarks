class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Liked!"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "Error! Please try again."
      redirect_to @bookmark.topic
    end
  end

   def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])

    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "Error! Please try again."
      redirect_to @bookmark.topic
    end
  end
