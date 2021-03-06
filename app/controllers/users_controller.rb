class UsersController < ApplicationController

  include SessionsHelper

  def new
    @user = User.new
    render :new
  end

  def show
    if logged_in?
      @current_user = set_current_user
    	@topics = @current_user.topics
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end
