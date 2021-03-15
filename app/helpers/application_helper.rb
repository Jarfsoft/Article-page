# frozen_string_literal: true

module ApplicationHelper
  def show_categories(cat)
    return ['-'] if cat.nil?

    cat
  end

  def my_projects
    return unless logged_in?

    link_to 'My projects', my_projects_path, class: 'nav-link text-muted'
  end

  def show_project(project)
    return if project.nil?

    render 'project', obj: project
  end

  def show_category(category)
    return if category.nil?

    render 'category', obj: category
  end

  def reduce_text(content)
    return content if content.length <= 100

    "#{content[0..80]}..."
  end

  def votes_number(project)
    Vote.where(['project_id = ?', project.id]).count
  end

  def logout_login
    if logged_in?
      link_to 'logout', logout_url, method: :delete
    else
      link_to 'login', login_url
    end
  end

  def username_register
    if logged_in?
      current_user.username
    else
      link_to 'register', register_url
    end
  end
end
