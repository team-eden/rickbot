require 'sinatra/base'

module SlackRickbot
  class Web < Sinatra::Base
    get '/' do
      'What up my glip glops!'
    end
  end
end
