class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return true if current_user

    false
  end

  def require_user
    redirect_to login_path unless logged_in?
  end

  def get_project(num)
    relation = Projectcategoryrelationship.includes(:category, :project)
    projects = []
    relation.each { |r| projects << r if r.category.priority == num }
    return projects.last.project unless projects.last.nil?

    nil
  end

  def go_to(project, msg)
    flash[:notice] = msg
    redirect_to project_path(project)
  end
end
