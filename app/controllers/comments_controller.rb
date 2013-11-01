class CommentsController < ApplicationController
  def new
    @topic = Topic.find(params[:id])
    @comment = @topic.comments.new
    render :new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
    @comment.text = params[:comment][:text]
    @comment.save
    redirect_to topic_path(@topic.id)
  end
end