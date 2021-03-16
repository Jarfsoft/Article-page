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
end
