def welcome
  puts " "
  puts "**************************"
  puts "**************************"
  puts "Welcome to Market Mood Analyzer"
  puts "helps you understand public mood on companies stock at the moment"
  puts "**************************"
  puts "**************************"
  puts " "
end

def main_help_menu
  puts "------------------------------------------------------------------"
  puts "1. login                                 to log into the application"
  puts "2. create account                        creates a new username"
  puts "3. list                                  lists companies available to add to your portfolio"
  puts "4. help                                  lists commands aviable"
  puts "5. exit                                  exit the application"
  puts "------------------------------------------------------------------"
end

def user_help_menu
  puts "------------------------------------------------------------------"
  puts "1. list                                  companies listed in database"
  puts "2. list my portfolio                     lists your portfolio companies"
  puts "3. portfolio mood                        lists your portfolio companies and their market mood to"
  puts "4. add company                           adds a company from the list to your portfolio"
  puts "5. create company                        adds a company to the list and adds the company to your portfolio"
  puts "6. delete company                        removes company from your portfolio list"
  puts "7. help                                  lists commands aviable"
  puts "8. logout                                log out of this account"
  puts "------------------------------------------------------------------"
end
