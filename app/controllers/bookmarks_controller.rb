class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    @bookmark.url = params[:bookmark][:url]
    @bookmark.topic = @topic
    @bookmark.user_id = current_user.id

    if @bookmark.save
      flash[:notice] = 'Bookmark was saved successfully.'
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = 'Error saving the bookmark.'
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = 'Bookmark was successfully updated.'
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = 'Error saving the bookmark.'
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was successfully deleted."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = 'Error deleting the bookmark.'
      render :show
    end
  end
end
