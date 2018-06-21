require 'rest-client'
require 'json'

class StockDataAPI

  alphavantage_web_address  = "https://www.alphavantage.co/query?function="



  def data_request(complete_web_address)
    json_data = RestClient.get(complete_web_address)
    data_hash = JSON.parse(json_data)
  end

  def complete_web_address
    "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=MSFT&interval=1min&apikey=demo"
  end



end
