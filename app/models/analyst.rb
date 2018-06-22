class Analyst < ActiveRecord::Base
  has_many :tweets
  has_many :companies, through: :tweets

  has_many :followers
  has_many :users, through: :followers

  def get_tweets(company_name, symbol)
    Twitter_api.analyst_tweets({analyst_twitter_id: self.twitter_id, c_name: company_name, t_symbol: symbol})
  end

  def get_sentiment(name, sym)
    x = self.get_tweets(name, sym)
    Indico_api.positive_sentiment(x)
  end

end
