User.destroy_all
sree = User.create(name: "Sree")
devin = User.create(name: "Devin")
bill = User.create(name: "Bill")
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


Analyst.destroy_all
jim = Analyst.create(name: "Jim Cramer", twitter_id: "jimcramer")
joe = Analyst.create(name: "Joe Weisenthal", twitter_id: "TheStalwart")
mw = Analyst.create(name: "Market Watch", twitter_id: "MarketWatch")
bm = Analyst.create(name: "Bloomberg Markets", twitter_id: "markets")
nycf = Analyst.create(name: "NYC Finance", twitter_id: "NYCFinance")


Follower.destroy_all
f1 = Follower.create(user: sree, analyst: jim)
f2 = Follower.create(user: sree, analyst: joe)
f3 = Follower.create(user: sree, analyst: mw)
f4 = Follower.create(user: devin, analyst: mw)
f5 = Follower.create(user: devin, analyst: bm)
f6 = Follower.create(user: bill, analyst: joe)
f7 = Follower.create(user: steve, analyst: joe)
f8 = Follower.create(user: steve, analyst: nycf)
