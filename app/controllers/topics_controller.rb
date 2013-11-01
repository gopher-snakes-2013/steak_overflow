class TopicsController < ApplicationController
  include SessionsHelper

  def index
    (@current_user = User.find(session[:user_id])) if logged_in? 
    @topics = Topic.all
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(params[:topic])
    redirect_to user_path(@topic.user_id)
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
    @topic    = Topic.find(params[:id])
    @comments = Comment.where(topic_id: @topic.id)
    @comment  = Comment.new
  end

end
