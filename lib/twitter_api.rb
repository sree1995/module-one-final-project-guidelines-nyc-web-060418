require 'twitter'
require 'yaml'

class Twitter_api

  # def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  # end

  def self.gather_tweets(company_ticker_symbol:)
    ticker_symbol = "$#{company_ticker_symbol} -filter:retweets"
    @client.search(ticker_symbol, result_type: "recent", lang: "en").take(50).collect do |tweet|
      "#{tweet.text}".chomp
    end
  end

end
