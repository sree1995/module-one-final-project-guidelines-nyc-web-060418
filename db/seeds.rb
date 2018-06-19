User.destroy_all
sree = User.create(name: "Sree")
devin = User.create(name: "Devin")
john = User.create(name: "John")
steve = User.create(name: "Steve")

Company.destroy_all
apple = Company.create(name: "Apple", ticker_symbol: "AAPL")
amazon = Company.create(name: "Amazon", ticker_symbol: "AMZN")
facebook = Company.create(name: "Facebook", ticker_symbol: "FB")
google = Company.create(name: "Google", ticker_symbol: "GOOGL")
microsoft = Company.create(name: "Microsoft", ticker_symbol: "MSFT")
netflix = Company.create(name: "Netflix", ticker_symbol: "NFLX")

Portfolio.destroy_all
p1  = Portfolio.create(user: sree, company: apple)
p2  = Portfolio.create(user: sree,  company: google)
p3  = Portfolio.create(user: steve,  company: apple)
p4  = Portfolio.create(user: devin,  company: google)
p5  = Portfolio.create(user: devin,  company: facebook)
p6  = Portfolio.create(user: devin,  company: netflix)
