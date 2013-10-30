class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def create
    @topic = Topic.new
    @topic.title = params[:topic][:title]
    @topic.content = params[:topic][:content]
    @topic.save
    render :index
  end
end