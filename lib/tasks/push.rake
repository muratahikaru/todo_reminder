namespace :push_line do
  desc "期限に迫った課題を通知します"
  task push_line_message: :environment do
    tasks = Task.where("deadline >= ? AND deadline < ? ", Date.today.ago(0.day), Date.today.since(1.day)) #期限当日の課題を取得
    pushed_users_ids = tasks.pluck(:user_id).uniq #メッセージを送るユーザのidを配列形式で保存

    pushed_users_ids.each do |pushed_user_id| #ユーザの数だけ繰り返す
      user = User.find_by(id: pushed_user_id) #ユーザの取得
      tasks = tasks.where(user_id: user.id) #ユーザに応じた期限当日の課題を取得
      task_message = "" #課題を一つの変数に代入
      tasks.each do |task|
        task_message = task_message + task.name + "：" + task.deadline.strftime("%Y年%m月%d日 %H時%M分") + "\n\n"
      end

      message = {
        type: 'text',
        text: "※課題の期限が近づいています!\n\n" + task_message
      }

      client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }

      client.push_message(user.uid, message)
    end
  end
end