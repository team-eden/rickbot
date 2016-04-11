module SlackMathbot
  module Commands
    class Morty < SlackRubyBot::Commands::Base
      @responder = "Morty: "
      match /^This sucks$/ do |client, data, match|
        client.say(channel: data.channel, text: "#{@responder} Aw, c'mon Rick. That doesn't seem so bad.")
      end
    end
  end
end
