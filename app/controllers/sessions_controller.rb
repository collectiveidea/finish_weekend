class SessionsController < ApplicationController
  layout "session"

  def new
    @events = []
    @user = User.new
  end

  def create
    if User.authenticate(params[:user][:username], params[:user][:password])
      session[:user] = { :valid => true }
      redirect_to manage_path
    else
      flash[:error] = "Username / Password was incorrect"
      redirect_to new_sessions_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
