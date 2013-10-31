class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    render :new
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user_id = session[:user_id]
    @topic.save
    redirect_to root_path
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = Comment.where(topic_id: @topic.id)
    @comment = Comment.new
  end

end