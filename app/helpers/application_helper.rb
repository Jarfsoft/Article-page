module ApplicationHelper
  def show_categories(cat)
    return ['-'] if cat.nil?

    cat
  end

  def my_projects
    return unless logged_in?

    link_to 'My projects', my_projects_path, class: 'nav-link text-muted'
  end
end
