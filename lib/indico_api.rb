require 'indico'

class IndicoAPI

  Indico.api_key =  'a0ee4985126bd8c066f05d6d35c7791f'
  config.consumer_key        = keys['CONSUMER_KEY']
  # # single example
  #
  #
  # # batch example
  # Indico.sentiment_hq([
  #     "I love writing code!",
  #     "Alexander and the Terrible, Horrible, No Good, Very Bad Day"
  # ])

  def self.run(text)
    positive_percent = (Indico.sentiment_hq(text) * 100.0)
    "Positive Percentage: #{positive_percent}"
  end

end
