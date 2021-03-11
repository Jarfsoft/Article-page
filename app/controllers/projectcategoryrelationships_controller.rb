class ProjectcategoryrelationshipsController < ApplicationController
  def new; end

  def create
    new_relation = Projectcategoryrelationship.new(class_params)
    if new_relation.save
      redirect_to project_path(new_relation.project_id)
    else
      redirect_to project_path(new_relation.project_id)
    end
  end

  def destroy
    destroying_relation = Projectcategoryrelationship.where(class_params)
    project = destroying_relation[0][:project_id]
    destroying_relation[0].destroy
    redirect_to project_path(project)
  end

  private

  def class_params
    params.require(:projectcategoryrelationship).permit(:project_id, :category_id)
  end
end
