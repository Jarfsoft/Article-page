# frozen_string_literal: true

class VotesController < ApplicationController
  def new; end

  def create
    vote = Vote.new(vote_params)
    project = vote[:project_id]
    vote.save
    go_to(project, 'Voted.')
  end

  def destroy
    vote = Vote.where(vote_params)
    project = vote[0][:project_id]
    vote[0].destroy
    go_to(project, 'Unvoted')
  end

  private

  def vote_params
    params.require(:vote).permit(:user_id, :project_id)
  end

  def go_to(project, msg)
    flash[:notice] = msg
    redirect_to project_path(project)
  end
end
