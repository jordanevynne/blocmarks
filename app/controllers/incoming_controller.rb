class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(title: params[:subject])
    @url = params['body-plain']

    if @user.nil?
      @user = User.create!(email: params[:sender], password: params[:sender])
    end

    @topic = Topic.create!(title: params[:subject]) if @topic.nil?

    @bookmark = @topic.bookmarks.create!(url: @url)

    head 200
    end
  end
