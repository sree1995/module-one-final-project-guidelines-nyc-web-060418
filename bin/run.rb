require_relative '../config/environment'

##methods to run the application

# def welcome
  puts "Welcome to Market Mood"
  puts "helps you understand public state on stock market"
  user=User.first
  puts user.companies
  user.delete_a_company_from_users_list("Google")
  puts user.companies
# end

# def run
  # welcome
# end
