namespace :push_line do
  desc "期限に迫った課題を通知します"
  task push_line_message: :environment do
    message = {
      type: 'text',
      text: "OR2の提出期限が近づいています"
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
    client.push_message("U9666e03f707e92af91547a7001d384be", message)
    end
end