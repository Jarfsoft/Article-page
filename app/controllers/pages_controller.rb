# frozen_string_literal: true

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

  def votes
    v = Vote.all
    return Project.last if v.first.nil?

    c = create_hash(v)
    r = count_votes(c)
    Project.find_by(id: r)
  end

  def create_hash(urns)
    c = {}
    urns.each do |i|
      c[i.project_id] += 1 if c.keys.include?(i.project_id)
      c[i.project_id] = 1 unless c.keys.include?(i.project_id)
    end
    c
  end

  def count_votes(hash)
    v = 0
    r = 0
    k = hash.keys
    (0...hash.size).each do |i|
      if hash[k[i]] > v
        v = hash[k[i]]
        r = k[i]
      end
    end
    r
  end
end
