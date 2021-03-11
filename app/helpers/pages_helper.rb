module PagesHelper
  def big_image(project)
    return image_tag 'default.jpg', class: 'container-fluid' if project.nil?

    img = project.image
    return image_tag 'default.jpg', class: 'container-fluid' if img.nil?

    image_tag img, class: 'container-fluid'
  end

  def small_image(project)
    return image_tag 'default.jpg', class: 'container-fluid px-0' if project.nil?

    img = project.image
    return image_tag 'default.jpg', class: 'container-fluid px-0' if img.nil?

    image_tag img, class: 'container-fluid px-0'
  end

  def no_project_yet_title(project)
    return 'No project yet.' if project.nil?

    project.title
  end

  def no_project_yet_text(project)
    return 'No project yet.' if project.nil?

    project.text
  end
end
