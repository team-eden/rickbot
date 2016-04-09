$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'
Dotenv.load

require 'slack_rickbot'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    SlackRickbot::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackRickbot::Web
