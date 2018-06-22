class Tweet < ActiveRecord::Base
  belongs_to :company
  belongs_to :analyst

end
