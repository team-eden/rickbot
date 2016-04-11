module SlackMathbot
  module Commands
    class Github < SlackRubyBot::Commands::Base

      #command 'issues' do |client, data, match|
      match /^Github issues on (?<repo>\w*)\?$/ do |client, data, match|
        # repo_url = "https://api.github.com/repos/#{match[:repo]}"
        # resp = HTTParty.get(repo_url)
        # resp = JSON.parse resp.body
        # response_message = "There are #{resp['open_issues_count']} open issues on #{repo}"
        # client.say(channel: data.channel, text: response_message)
        client.say(channel: data.channel, text: 'Gotcha')
      end
    end
  end
end
