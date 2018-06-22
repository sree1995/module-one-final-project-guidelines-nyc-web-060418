class Company < ActiveRecord::Base
  has_many :portfolios
  has_many :users, through: :portfolios

  has_many :tweets
  has_many :analysts, through: :tweets

  def get_tweets
    Twitter_api.gather_tweets(company_ticker_symbol: self.ticker_symbol)
  end

  def get_sentiment
    Indico_api.positive_sentiment(self.get_tweets)
  end

  def stock_data
    StockDataAPI.call(self.ticker_symbol)
  end

  def stock_values_data
    stock_values = stock_data
    [ stock_values["4. close"].to_f, stock_values["1. open"].to_f, stock_values["2. high"].to_f , stock_values["3. low"].to_f,  stock_values["6. volume"].to_f]
  end


end
