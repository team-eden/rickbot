require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  message = params[:text].gsub(params[:trigger_word], '').strip

  action, repo = message.split('_').map {|c| c.strip.downcase }
  repo_url = "https://api.github.com/repos/#{repo}"

  case action
    return unless authorized(params[:token])
    when 'issues'
      resp = HTTParty.get(repo_url)
      resp = JSON.parse resp.body
      respond_message "There are #{resp['open_issues_count']} open issues on #{repo}"
    when 'standup!'
      respond_message call_for_standup
  end
end

def respond_message message
  content_type :json
  {:text => message, data: }.to_json
end

def authorized(token)
  token != ENV['SLACK_TOKEN']
end

def call_for_standup
  message = "Time for an adventure...\n"
  random_members.each do |member|
    message << "> #{member}\n"
  end
end

def random_members
  standup_members.shuffle
end

def standup_members
  ['aaron', 'linden', 'yockey', 'mattv']
end
