class ProjectsController < ApplicationController
  before_action :set_project, except: %i[new create]
  before_action :require_user, except: [:show]
  before_action :require_same_user, only: %i[edit update]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.author_id = current_user.id
    if @project.save
      redirect_to root_path
    else
      render new
    end
  end

  def show
    relations = Projectcategoryrelationship.where('project_id = ?', @project.id)
    @categories = []
    relations.each do |r|
      @categories << Category.find_by(id: r.category_id)
    end

  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Your event was updated'
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :text, :image)
  end

  def require_same_user
    redirect_to @project unless current_user == @project.author
  end
end
