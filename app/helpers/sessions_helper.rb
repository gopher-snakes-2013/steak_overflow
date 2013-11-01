module SessionsHelper

  def logged_in?
    return true if session[:user_id]
  end

  def sign_in(user)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    end
  end

  def set_current_user
    current_user = User.find(session[:user_id])
  end

  def logout
    session.clear
  end
end
