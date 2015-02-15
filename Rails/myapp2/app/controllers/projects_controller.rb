class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :destroy, :edit, :update]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(params[:id])
  end

private

  def project_params
    params[:project].permit(:title)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
