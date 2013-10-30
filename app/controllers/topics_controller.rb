class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    render :new
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.content = params[:topic][:content]
    @topic.save
    render :index
  end

  def show
    @topic = Topic.find(params[:id])
  end

end