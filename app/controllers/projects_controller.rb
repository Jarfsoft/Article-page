class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.author_id = current_user.id
    if @project.save
      redirect_to root
    else
      render new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: 'Your event was updated'
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :text, :image)
  end
end
