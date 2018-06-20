class Company < ActiveRecord::Base
  has_many :portfolios
  has_many :users, through: :portfolios

  def get_tweets
    Twitter_api.gather_tweets(company_ticker_symbol: self.ticker_symbol)
  end

  def get_sentiment
    Indico_api.positive_sentiment(self.get_tweets)
  end

end
