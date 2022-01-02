class V1::ProjectsController < ApplicationController
  def projects_get
    @projects = Project.all
    render :template => 'projects_get.json.jb'
  end

  def projects_post
    name = params[:name]
    project = Project.new(name: name)
    project.save!
    render :template => 'projects_post.json.jb', :locals => { :id => project.id }
  end
end
