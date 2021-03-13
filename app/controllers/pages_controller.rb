class PagesController < ApplicationController
  def home
    fill_categories
    @voted_project = Project.first
    @categories = []
    @categories << get_project(1)
    @categories << get_project(2)
    @categories << get_project(3)
    @categories << get_project(4)
  end

  def my_projects
    redirect_to root_path unless logged_in?
    @projects = Project.where(['author_id = ?', current_user.id])
  end

  def fill_categories
    return unless Category.first.nil?

    Category.create(name: 'Economy', priority: 1)
    Category.create(name: 'Education', priority: 2)
    Category.create(name: 'Science and Technology', priority: 3)
    Category.create(name: 'Entertainment', priority: 4)
  end

  private

  def get_category_id(num)
    Category.find_by(priority: num).id
  end

  def get_first_project_from_category(num)
    Projectcategoryrelationship.where(['category_id = ?', get_category_id(num)]).first
  end

  def get_project(num)
    relation = get_first_project_from_category(num)
    return Project.find_by(id: relation.project_id) unless relation.nil?

    nil
  end
end
