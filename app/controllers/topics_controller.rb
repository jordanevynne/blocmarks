class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]

    if @topic.save
      flash[:notice] = 'Topic was saved successfully.'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error saving the topic.'
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.title = params[:topic][:title]

    if @topic.save
      flash[:notice] = 'Topic was updated successfully.'
      redirect_to @topic
    else
      flash.now[:alert] = 'Error saving topic.'
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = 'Error deleting the topic.'
      render :show
    end
  end
end
