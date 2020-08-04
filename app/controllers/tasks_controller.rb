# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    new_task = Task.new(task_params)
    new_task.save
    redirect_to task_path(new_task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
