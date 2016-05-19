class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]
    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark was saved successfully."
      redirect_to @bookmark
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving your bookmark. Please try again."
      render :new
    end
  end

  def edit
  end
end
