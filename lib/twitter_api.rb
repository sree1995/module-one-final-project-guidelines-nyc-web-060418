require 'twitter'
require 'yaml'
require 'date'

class Twitter_api

    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end

  def self.gather_tweets(company_ticker_symbol:)
    ticker_symbol = "$#{company_ticker_symbol} -filter:retweets"
    @client.search(ticker_symbol, result_type: "recent", lang: "en").take(20).collect do |tweet|
      "#{tweet.text}".chomp
    end
  end

  def self.analyst_tweets(parms = {})
    company_name =  parms[:c_name]
    ticker_symbol = parms[:t_symbol]
    twitter_id = parms[:analyst_twitter_id]
    # d = DateTime.now
    # today_date = "since:#{d.month}-#{d.day - 7}-#{d.year}"
    # since:#{today_date}
    @client.search("#{company_name} OR $#{ticker_symbol} from:#{twitter_id}",result_type: "recent", lang: "en").take(20).collect do |tweet|
      "#{tweet.text}".chomp
    end
  end

end
