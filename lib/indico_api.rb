require 'indico'
require 'yaml'

class Indico_api

  ## load yml file
  key = YAML.load_file('indico_application.yml')

  ## assign it to indico api key
  Indico.api_key =  key['CONSUMER_KEY']

  def self.positive_sentiment(tweets_text)
    positive_percent_values = (Indico.sentiment_hq(tweets_text) * 100.0)
    avg_positive_percent = (positive_percent_values.sum / positive_percent_values.count) * 100
    "Positive: #{avg_positive_percent.round}%"
  end

end
