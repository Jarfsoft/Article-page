class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @projects = []
    @categories.each { |i| @projects << get_project(i.priority) }
  end

  def show
    @projects = []
    r = Projectcategoryrelationship.where(['category_id = ?', params[:id]])
    r.each { |i| @projects << Project.find_by(id: i.project_id) }
    @category = Category.find_by(id: params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

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
