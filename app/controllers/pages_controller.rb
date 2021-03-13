class PagesController < ApplicationController
  def home
    @voted_project = Project.first
    @categories = []
    relation = get_first_project_from_category(1)
    @categories << get_project(relation)
    relation = get_first_project_from_category(2)
    @categories << get_project(relation)
    relation = get_first_project_from_category(3)
    @categories << get_project(relation)
    relation = get_first_project_from_category(4)
    @categories << get_project(relation)
  end

  def my_projects
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
    return Project.find_by(id: num.project_id) unless num.nil?

    nil
  end
end
