class Company < ActiveRecord::Base
  has_many :portfolios
  has_many :users, through: :portfolios

  def get_tweets
    Twitter_api.gather_tweets(company_ticker_symbol: self.ticker_symbol)
  end

  def get_sentiment
    Indico_api.positive_sentiment(self.get_tweets)
  end

  def stock_data
    StockDataAPI.call(self.ticker_symbol)
  end

  def stock_open
    stock_data["1. open"].to_f
  end

  def stock_high
    stock_data["2. high"].to_f
  end

  def stock_low
    stock_data["3. low"].to_f
  end

  def stock_close
    stock_data["4. close"].to_f
  end

  def stock_volume
    stock_data["6. volume"].to_f
  end


end
