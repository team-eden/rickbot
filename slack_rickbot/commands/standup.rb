module SlackMathbot
  module Commands
    class Standup < SlackRubyBot::Commands::Base
      command 'standup' do |client, data, _match|
        caller = data.user
        client.say(channel: data.channel, text: call_for_standup(caller))
      end

      def self.call_for_standup(caller)
        message = "<@#{caller}> says, time for an adventure...\n"
        random_start = random_members.sample
        random_members.each do |member|
          pre = (member == random_start) ? 'Starts:' : '*'
          message << "#{pre} <@#{member}>\n"
        end
        message
      end

      def self.random_members
        standup_members.shuffle
      end

      def self.standup_members
        ['aaron', 'linden', 'yockey', 'mattv']
      end
    end
  end
end
