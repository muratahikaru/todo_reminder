module TasksHelper
  def datetime_formatter(deadline)
    deadline.strftime("%Y年%m月%d日 %H時:%M分")
  end
end
