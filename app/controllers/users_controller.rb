class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
  	@user = User.find(params[:id])
  	@topics = @user.topics
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to root_path
  end
end
