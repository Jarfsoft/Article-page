class PagesController < ApplicationController
  def home
    fill_categories
    @voted_project = votes
    @categories = []
    (1..4).each { |i| @categories << get_project(i) }
  end

  def my_projects
    redirect_to root_path unless logged_in?
    @projects = Project.where(['author_id = ?', current_user.id]) if logged_in?
  end

  def fill_categories
    return unless Category.first.nil?

    Category.create(name: 'Economy', priority: 1)
    Category.create(name: 'Education', priority: 2)
    Category.create(name: 'Science and Technology', priority: 3)
    Category.create(name: 'Entertainment', priority: 4)
  end

  private

  def get_category_id(num)
    Category.find_by(priority: num).id
  end

  def get_last_project_from_category(num)
    Projectcategoryrelationship.where(['category_id = ?', get_category_id(num)]).last
  end

  def get_project(num)
    relation = get_last_project_from_category(num)
    return Project.find_by(id: relation.project_id) unless relation.nil?

    nil
  end

  def votes
    v = Vote.all
    return Project.last if v.first.nil?

    c = {}
    v.each do |i|
      c[i.project_id] += 1 if c.keys.include?(i.project_id)
      c[i.project_id] = 1 unless c.keys.include?(i.project_id)
    end

    v = 0
    r = 0
    k = c.keys
    (0...c.size).each do |i|
      if c[k[i]] > v
        v = c[k[i]]
        r = k[i]
      end
    end
    Project.find_by(id: r)
  end
end
