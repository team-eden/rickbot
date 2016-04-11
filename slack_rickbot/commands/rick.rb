module SlackMathbot
  module Commands
    class Rick < SlackRubyBot::Commands::Base
      @responder = "Rick: "
      command 'talk to me', "what's up?" do |client, data, match|
        quotes = get_rick_quotes
        client.say(channel: data.channel, text: quotes.sample)
      end

      match /^Let's do it!$/ do |client, data, match|
        client.say(channel: data.channel, text: "#{@responder} Ohh yea, you gotta get schwifty.")
      end

      def self.get_rick_quotes
        rick_quotes = []
        file = File.new(File.join('data', 'rick.txt'), "r")
        while (line = file.gets)
            rick_quotes << line unless line.match(/^#/)
        end
        file.close
        rick_quotes
      end
    end
  end
end
