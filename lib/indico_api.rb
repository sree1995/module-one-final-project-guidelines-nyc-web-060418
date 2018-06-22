require 'indico'
require 'yaml'
require 'colorize'

class Indico_api

  ## load yml file
  key = YAML.load_file('indico_application.yml')

  ## assign it to indico api key
  Indico.api_key =  key['CONSUMER_KEY']

  def self.positive_sentiment(tweets_text)
    positive_percent_values = (Indico.sentiment(tweets_text) * 100.0)
    avg_positive_percent = (positive_percent_values.sum / positive_percent_values.count) * 100
    if avg_positive_percent >= 80
      "#{avg_positive_percent.round}%".colorize(:light_green)
    elsif avg_positive_percent.between?(40, 80)
      "#{avg_positive_percent.round}%".colorize(:light_yellow)
    elsif  avg_positive_percent <= 40
    "#{avg_positive_percent.round}%".colorize(:light_red)
    end
  end

end
