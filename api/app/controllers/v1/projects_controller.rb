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

  def projects_project_id_delete
    project_id = params[:project_id]
    project = Project.find(project_id)
    project.destroy!
    render :template => 'projects_project_id_delete.json.jb', :locals => { :id => project_id }
  end
end
