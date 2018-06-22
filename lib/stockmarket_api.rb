require 'rest-client'
require 'json'

class StockDataAPI

  AV_WEB_ADDRESS  = "https://www.alphavantage.co/"

  ## load yml file
  key = YAML.load_file('alphavantage_apikey.yml')
  API_KEY = key['CONSUMER_KEY']


  def data_request(api_link)
    json_data = RestClient.get(api_link)
    data_hash = JSON.parse(json_data)
  end

  def api_parameters(ticker_symbol)
    function = "TIME_SERIES_DAILY_ADJUSTED"
    symbol = ticker_symbol
    apikey = API_KEY
    api_link = AV_WEB_ADDRESS + "query?" + "function=#{function}&" + "symbol=#{symbol}&" + "datatype=json&" + "apikey=#{apikey}"
    data_request(api_link)
  end

  def relavent_data(ticker_symbol)
    data_hash = api_parameters(ticker_symbol)

    time_series = data_hash["Time Series (Daily)"].map do |day|
      day
    end

    time_series[0][1]
  end

  def self.call(ticker_symbol)
    StockDataAPI.new.relavent_data(ticker_symbol)
  end
end
