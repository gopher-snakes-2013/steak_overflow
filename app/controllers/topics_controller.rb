class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    render :new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.content = params[:topic][:content]
    @topic.save
    redirect_to root_path
  end

  def show
    @topic = Topic.find(params[:id])
    @comments = Comment.where(topic_id: @topic.id)
    @comment = Comment.new
  end

end