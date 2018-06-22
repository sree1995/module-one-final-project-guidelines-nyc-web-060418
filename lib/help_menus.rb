require 'colorize'

def welcome
  puts " "
  puts "*********************************************************".colorize(:color => :black, :background => :green)
  puts "*********************************************************".colorize(:color => :black, :background => :green)
  puts "
8888888888888b     d888 88b      d888       d8888
888       8888b   d8888 8888b   d8888      d88888
888       88888b.d88888 88888b.d88888     d88P888
8888888   888Y88888P888 888Y88888P888    d88P 888
888       888 Y888P 888 888 Y888P 888   d88P  888
888       888  Y8P  888 888  Y8P  888  d88P   888
888       888       888 888       888 d8888888888
888       888       888 888       888d88P     888".colorize(:color => :green)
  puts " "
  puts "Welcome to your Personal - Financial Market Mood Analyzer".colorize(:color => :green)
  puts "helps you understand public mood on companies stock at the moment".colorize(:color => :green)
  puts "*********************************************************".colorize(:color => :black, :background => :green)
  puts "*********************************************************".colorize(:color => :black, :background => :green)
  puts " "
end

def main_help_menu
  puts "------------------------------------------------------------------"
  puts "1. login                                 to log into the application"
  puts "2. create account                        creates a new username"
  puts "3. list                                  lists companies available to add to your portfolio"
  puts "4. help                                  lists commands available"
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
  puts "7. list my analysts                      lists analysts you follow"
  puts "8. add analyst                           follow an analyst from the list"
  puts "9. create analyst                        add an analyst to the list and follow them"
  puts "10. delete analyst                       unfollow an analyst"
  puts "11. help                                 lists commands available"
  puts "12. logout                               log out of this account"
  puts "------------------------------------------------------------------"
end
