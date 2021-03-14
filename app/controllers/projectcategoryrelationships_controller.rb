# frozen_string_literal: true

class ProjectcategoryrelationshipsController < ApplicationController
  def new; end

  def create
    relation = Projectcategoryrelationship.where(class_params)[0]
    if relation
      flash[:notice] = 'That category is already added.'
      project = relation[:project_id]
      redirect_to project_path(project)
      return
    end
    new_relation = Projectcategoryrelationship.new(class_params)
    flash[:notice] = 'Something went wrong while trying to add category.' unless new_relation.save
    redirect_to project_path(new_relation.project_id)
  end

  def destroy
    destroying_relation = Projectcategoryrelationship.where(class_params)
    project = destroying_relation[0][:project_id]
    destroying_relation[0].destroy
    flash[:notice] = 'The category was removed.'
    redirect_to project_path(project)
  end

  private

  def class_params
    params.require(:projectcategoryrelationship).permit(:project_id, :category_id)
  end
end
