class SessionsController < ApplicationController

  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:session][:username])

    if sign_in(user)
      redirect_to root_path
    else
      redirect_to new_session_path
    end 
  end

  def destroy
    logout
    redirect_to root_path
  end
end
