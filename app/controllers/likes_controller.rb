class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = 'Liked!'
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = 'Error! Please try again.'
      redirect_to @bookmark
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = 'Unliked!'
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = 'Error! Please try again.'
      redirect_to [@bookmark.topic, @bookmark]
    end
 end
end
