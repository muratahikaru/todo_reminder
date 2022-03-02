class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザーを追加しました"
      redirect_to users_path
    else
      flash[:alert] = "ユーザーの追加に失敗しました"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path(@user)
    else
      flash[:alert] = "ユーザーの更新に失敗しました"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "削除しました"
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :uid, :password, :password_confirmation, :is_admin)
  end

  def correct_user
    @user = User.find_by(id: params[:id])
    unless @user = current_user || is_admin?
      log_out
      redirect_to root_url
    end
  end

end
