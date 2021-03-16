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

  def get_category_id(num)
    Category.find_by(priority: num).id
  end

  def get_last_project_from_category(num)
    Projectcategoryrelationship.where(['category_id = ?', get_category_id(num)]).last
  end

  def get_project(num)
    relation = get_last_project_from_category(num)
    return Project.find_by(id: relation.project_id) unless relation.nil?

    nil
  end

  def go_to(project, msg)
    flash[:notice] = msg
    redirect_to project_path(project)
  end
end
