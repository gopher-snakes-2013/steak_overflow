class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @topic = Topic.find(params[:id])
    @comment = Comment.new
    render :new
  end

  def create
    @topic = Topic.find(params[:comment][:topic_id])
    @comment = Comment.new
    @comment.text = params[:comment][:text]
    @comment.topic_id = params[:comment][:topic_id]
    @comment.save
    redirect_to topic_path(@topic.id)
  end
end