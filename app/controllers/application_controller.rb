class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to root_url
    end
  end
end
