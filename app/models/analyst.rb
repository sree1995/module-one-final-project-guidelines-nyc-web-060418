class Analyst < ActiveRecord::Base
  has_many :tweets
  has_many :companies, through: :tweets

  has_many :followers
  has_many :users, through: :followers
end
