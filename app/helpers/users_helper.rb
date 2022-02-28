module UsersHelper
  def is_admin?
    @current_user.is_admin?
  end

  def check_admin(user)
    if user.is_admin
      "管理者"
    else
      "ユーザー"
    end
  end
end
