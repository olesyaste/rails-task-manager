class TasksController < ApplicationController
before_action :set_task, only: [ :edit, :update, :show, :destroy ]
def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    if @task.save
      redirect_to tasks_path(@tasks)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(params_task)
      redirect_to tasks_path(@task)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to tasks_path(@tasks)
  end

  def set_task
  	@task = Task.find(params[:id])
  end

  private

  def params_task
    params.require(:task).permit(:title, :details, :completed)
  end
end
