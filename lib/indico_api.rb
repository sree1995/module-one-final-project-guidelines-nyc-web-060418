require 'indico'
require 'yaml'

class Indico_api

  ## load yml file
  key = YAML.load_file('indico_application.yml')

  ## assign it to indico api key
  Indico.api_key =  key['CONSUMER_KEY']


  # # single example
  #
  #
  # # batch example
  # Indico.sentiment_hq([
  #     "I love writing code!",
  #     "Alexander and the Terrible, Horrible, No Good, Very Bad Day"
  # ])

  def self.run(tweets_text)
    puts positive_sentiment


  end

  def positive_sentiment
    positive_percent_values = (Indico.sentiment_hq(tweets_text) * 100.0)
    avg_positive_percent = (positive_percent_values.sum / positive_percent_values.count) * 100
    "Positive: #{avg_positive_percent.round}%"
  end

end
