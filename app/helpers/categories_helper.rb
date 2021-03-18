module CategoriesHelper
  def categories_grid_image(project)
    return image_tag 'default.jpg', class: 'crop-center-square' if project.nil?

    img = project.image_url
    return link_to image_tag('default.jpg', class: 'crop-center-square'), project_path(project) if img.nil?

    link_to image_tag(img, class: 'crop-center-square'), project_path(project)
  end
end
