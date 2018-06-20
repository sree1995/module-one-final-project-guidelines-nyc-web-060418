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
  puts " "
  help_before_user_created
  puts " "
  puts "enter your command"
  user_command = gets.downcase.chomp

  case user_command
  when "help"
    help_before_user_created
  when "login"
    login_process
  when "create account"
    puts "Enter a username to create your account"
    create_account_process
    app_flow_after_user_created
  when "list"
    companies_in_list
  when "exit"
    abort("Thank You. Hope You made $$$$$")
  else
    puts "Invalid command"
    app_flow_before_user_created
  end

end

def create_account_process
  user_command = gets.chomp
  user_name = user_command
  if User.find_user(user_name) == nil
    User.create(user_name)
    app_flow_after_user_created
  else
    puts "Username taken, please enter another name"
    create_account_process
  end
end

def companies_in_list
  puts "Companies in our List"
  puts " "
  Company.all.each do |company_instance|
    puts "#{company_instance.name}"
  end
  app_flow_before_user_created
end



def login_process
  puts "enter a username"
  user_command = gets.chomp
  login_name = user_command
  if User.find_user(login_name) == nil
    puts "User doesn't exist!"
    app_flow_before_user_created
  else
    app_flow_after_user_created(login_name)
  end
end

def app_flow_after_user_created(login_name)
  help_after_user_created
  logged_in_user = User.find_user(login_name)
end

app_flow_before_user_created
