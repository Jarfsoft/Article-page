class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.username}."
      redirect_to root_path
    else
      flash[:notice] = 'That didn\'t work.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out.'
    redirect_to root_path
  end
end
