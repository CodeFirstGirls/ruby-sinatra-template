require 'twitter'
require 'dotenv/load'
class TwitterAPIWrapper
  def initialize
  end

  def get_tweets(search_term)
    twitter_api.search(search_term)
  end

  private
  def twitter_api
    Twitter::REST::Client.new do |config|
      config.consumer_key	        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret      = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token	        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret  = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end
