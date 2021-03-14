module PagesHelper
  def big_image(project)
    return image_tag 'default.jpg', class: 'container-fluid' if project.nil?

    img = project.image_url
    return link_to image_tag('default.jpg', class: 'container-fluid'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'container-fluid'), project_path(project)
  end

  def small_image(project)
    return image_tag 'default.jpg', class: 'size-photo px-0 crop-center' if project.nil?

    img = project.image_url
    return link_to image_tag('default.jpg', class: 'size-photo px-0 crop-center'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'size-photo px-0 crop-center'), project_path(project)
  end

  def my_projects_image(project)
    return image_tag 'default.jpg', class: 'my-projects-image crop-center' if project.nil?

    img = project.image_url
    return link_to image_tag('default.jpg', class: 'my-projects-image crop-center'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'my-projects-image crop-center'), project_path(project)
  end

  def category_image(project, category)
    return image_tag 'default.jpg', class: 'my-projects-image crop-center' if project.nil?

    img = project.image_url
    return link_to image_tag('default.jpg', class: 'my-projects-image crop-center'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'my-projects-image crop-center'), category_path(category)
  end

  def no_project_yet_title(project)
    return 'No project yet.' if project.nil?

    project.title
  end

  def no_project_yet_text(project)
    return 'No project yet.' if project.nil?

    project.text
  end

  def no_project
    return if @projects.first

    '<h1 class="py-5 my-5">No projects yet</h1>'.html_safe
  end
end
