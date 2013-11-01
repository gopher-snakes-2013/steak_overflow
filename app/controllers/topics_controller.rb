class TopicsController < ApplicationController
  include SessionsHelper

  def index
    (@current_user = User.find(session[:user_id])) if logged_in? 
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
