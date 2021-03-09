class PagesController < ApplicationController
  def home
    @voted_project = Project.first
  end
end
