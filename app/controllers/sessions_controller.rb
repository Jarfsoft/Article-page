class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end