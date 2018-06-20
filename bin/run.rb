require_relative '../config/environment'

##methods to run the application

def welcome
  puts "Welcome to Market Mood Analyzer"
  puts "helps you understand public mood on companies stock at the moment"
  puts "**************************"
  puts "**************************"
  puts " "
end

def help_before_user_created
  puts "login                                 to log into the application"
  puts "create account                        creates a new username"
  puts "list                                  lists companies available to add to your portfolio"
  puts "help                                  lists commands aviable"
  puts "exit                                  exit the application"
end

def help_after_user_created
  puts "list                                  lists companies available to add to your portfolio"
  puts "list my portfolio                     lists your portfolio companies"
  puts "portfolio mood                        lists your portfolio companies and their market mood to"
  puts "add company                           adds a company to your portfolio"
  puts "create company                        adds a company to the list and adds the company to your portfolio"
  puts "delete company                        removes company from your portfolio list"
  puts "help                                  lists commands aviable"
  puts "logout                                exit the application"
end

def app_flow_before_user_created
  help_before_user_created
  puts " "
  puts "enter your command"
  user_command = gets.downcase.chomp

  case user_command
  when "help"
    help_before_user_created
  when "login"
    user_command = gets.chomp
    login_name = user_command
    if user.login == nil
      puts "User doesn't exist!"
      p

    else
      puts "User already exists"
      puts "Please try another username"
      user_command = gets.chomp
    end
  end

end

def

def login

end

def app_flow_after_user_created
end
