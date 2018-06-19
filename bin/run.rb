require_relative '../config/environment'

sree = User.new(name: "Sree")
devin = User.new(name: "Devin")
john = User.new(name: "John")
steve = User.new(name: "Steve")

sree.save
devin.save
john.save
steve.save

apple = Company.new(name: "Apple", ticker_symbol: "AAPL")
amazon = Company.new(name: "Amazon", ticker_symbol: "AMZN")
facebook = Company.new(name: "Facebook", ticker_symbol: "FB")
google = Company.new(name: "Google", ticker_symbol: "GOOGL")
microsoft = Company.new(name: "Microsoft", ticker_symbol: "MSFT")
netflix = Company.new(name: "Netflix", ticker_symbol: "NFLX")

apple.save
amazon.save
facebook.save
microsoft.save
netflix.save

p1  = Portfolio.new(user: sree, company: apple)
p2  = Portfolio.new(user: sree, company: google)
p3  = Portfolio.new(user: steve, company: apple)
p4  = Portfolio.new(user: devin, company: google)
p5  = Portfolio.new(user: devin, company: facebook)
p6  = Portfolio.new(user: devin, company: netflix)

p1.save
p2.save
p3.save
p4.save
p5.save
p6.save

#####-------------------------x-----------------------------#####

##methods to run the application

def welcome
  puts "Welcome to Market Mood"
  puts "helps you understand public state on stock market"
end

def run
  welcome
end
