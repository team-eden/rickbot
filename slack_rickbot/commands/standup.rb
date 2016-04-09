module SlackMathbot
  module Commands
    class Standup < SlackRubyBot::Commands::Base
      @message = call_for_standup
      command 'standup' do |client, data, _match|
        client.say(channel: data.channel, text: @message)
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
    end
  end
end
