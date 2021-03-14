# frozen_string_literal: true

module ProjectsHelper
  def vote_unvote
    return unless logged_in?

    vote = Vote.where(['user_id = ? and project_id = ?', current_user.id, @project.id])[0]
    if vote
      link_to image_tag('unvote.png', class: 'vote'), use_unvote_direction, method: :delete
    else
      link_to image_tag('vote.png', class: 'vote'), use_vote_direction, method: :post
    end
  end

  def delete_category(category)
    return unless logged_in? && @project.author_id == current_user.id

    link_to 'Delete category', use_relation_direction(category), method: :delete, class: 'ml-2'
  end

  def add_category
    return unless logged_in? && @project.author_id == current_user.id

    render 'add_category'
  end

  def use_unvote_direction
    vote_path(@project, project_id: @project.id, vote: { user_id: current_user.id, project_id: @project.id })
  end

  def use_vote_direction
    votes_path(@project, project_id: @project.id, vote: { user_id: current_user.id, project_id: @project.id })
  end

  def use_relation_direction(category)
    projectcategoryrelationship_path(category, id: category.id,
                                               projectcategoryrelationship: { category_id: category.id,
                                                                              project_id: @project.id })
  end

  def show_image
    image_tag @project.image_url, class: 'img-400' if @project.image
  end
end
