class TasksController < ApplicationController
  # before_action :logged_in_user
  # before_action :correct_user

  def index
    @user = User.find_by(id: params[:user_id])
    @tasks = @user.tasks.where(is_finished: false)
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "保存しました"
      redirect_to user_tasks_path(params[:user_id])
    else
      flash.now[:danger] = "変更できませんでした"
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
      flash[:notice] = "変更しました"
      redirect_to user_tasks_path(params[:user_id])
    else
      flash.now[:danger] = "変更できませんでした"
      render 'edit'
    end
  end

  def destroy
  end

  def complete
    task = Task.find_by(id: params[:id])
    task.complete
    redirect_to user_tasks_path(params[:user_id])
  end

    private
      def task_params
        params.require(:task).permit(:name, :deadline).merge(user_id: params[:user_id])
      end

      def logged_in_user
        unless logged_in?
          flash[:danger] = "ログインしてください"
          redirect_to root_url
        end
      end

      def correct_user
        @user = User.find(params[:user_id])
        redirect_to(root_url) unless @user == current_user
      end
end
