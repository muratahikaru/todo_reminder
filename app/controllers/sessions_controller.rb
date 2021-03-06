class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "ログインしました"
      log_in user
      redirect_to user_tasks_path(user)
    else
      flash.now[:alert] = 'emailまたはパスワードが正しくありません'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
