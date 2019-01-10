require 'dotenv'
require 'slack'

Dotenv.load

client = Slack::Client.new token: ENV['SLACK_TOKEN']
rtm = client.realtime
rtm.on :message do |message|
  p message
  if message['text'] == 'ping'
    slack_client.chat_postMessage(
      channel: message['channel'],
      text: 'pong'
    )
  end
end

rtm.start
