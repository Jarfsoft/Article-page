class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @projects = []
    @categories.each { |i| @projects << get_project(i.priority) }
  end

  def show
    @projects = []
    r = Projectcategoryrelationship.includes(:project, :category).where(['category_id = ?', params[:id]])
    r.each { |i| @projects << i.project }
    @category = r.first.category
  end
end
