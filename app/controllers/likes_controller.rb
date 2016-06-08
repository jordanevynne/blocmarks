class LikesController < ApplicationController

  def index
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]
    @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Liked!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Error! Please try again."
      redirect_to @bookmark
    end
  end

   def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "Unliked!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Error! Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
