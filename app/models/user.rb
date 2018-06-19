class User < ActiveRecord::Base
  has_many :portfolios
  has_many :companies, through: :portfolios



end
