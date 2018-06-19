class Company < ActiveRecord::Base

  has_many :portfolios
  has_many :users, through: :portfolios

end
