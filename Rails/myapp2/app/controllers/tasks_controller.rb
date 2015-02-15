class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    @task.save
    redirect_to project_path(@project)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(:project_id)
  end

private

  def task_params
    params[:task].permit(:title)
  end
end
