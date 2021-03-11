module ProjectsHelper
  def vote_unvote(project)
    vote = Vote.where(['user_id = ? and project_id = ?', current_user.id, project.id])[0]
    if vote
      link_to image_tag('unvote.png', class: 'vote'), vote_path(project,
                                                                project_id: project.id,
                                                                vote: { user_id: current_user.id,
                                                                        project_id: project.id }), method: :delete
    else
      link_to image_tag('vote.png', class: 'vote'), votes_path(project,
                                                               project_id: project.id,
                                                               vote: { user_id: current_user.id,
                                                                       project_id: project.id }), method: :post
    end
  end
end
