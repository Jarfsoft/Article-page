module PagesHelper
  def big_image(project)
    return image_tag 'default.jpg', class: 'container-fluid' if project.nil?

    img = project.image
    return link_to image_tag('default.jpg', class: 'container-fluid'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'container-fluid'), project_path(project)
  end

  def small_image(project)
    return image_tag 'default.jpg', class: 'size-photo px-0 crop-center' if project.nil?

    img = project.image
    return link_to image_tag('default.jpg', class: 'size-photo px-0 crop-center'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'size-photo px-0 crop-center'), project_path(project)
  end

  def my_projects_image(project)
    return image_tag 'default.jpg', class: 'my-projects-image crop-center' if project.nil?

    img = project.image
    return link_to image_tag('default.jpg', class: 'my-projects-image crop-center'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'my-projects-image crop-center'), project_path(project)
  end

  def no_project_yet_title(project)
    return 'No project yet.' if project.nil?

    project.title
  end

  def no_project_yet_text(project)
    return 'No project yet.' if project.nil?

    project.text
  end

  def show_project(project)
    return if project.nil?

    render 'project', obj: project
  end

  def show_category(category)
    return if category.nil?

    render 'category', obj: category
  end
end
