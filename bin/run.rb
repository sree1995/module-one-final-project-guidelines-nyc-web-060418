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
  puts " "
  puts "login                                 to log into the application"
  puts "create account                        creates a new username"
  puts "list                                  lists companies available to add to your portfolio"
  puts "help                                  lists commands aviable"
  puts "exit                                  exit the application"
  puts " "
end

def help_after_user_created
  puts " "
  puts "list                                  lists companies available to add to your portfolio"
  puts "list my portfolio                     lists your portfolio companies"
  puts "portfolio mood                        lists your portfolio companies and their market mood to"
  puts "add company                           adds a company from the list to your portfolio"
  puts "create company                        adds a company to the list and adds the company to your portfolio"
  puts "delete company                        removes company from your portfolio list"
  puts "help                                  lists commands aviable"
  puts "logout                                logs out from your account"
  puts "exit                                  exit the application"
  puts " "
end

def app_flow_before_user_created
  puts " "
  help_before_user_created
  puts " "
  puts "enter your command"
  user_command = gets.downcase.chomp

  case user_command
  when "help"
    app_flow_before_user_created
  when "login"
    login_process
  when "create account"
    puts "Enter a username to create your account"
    create_account_process
    app_flow_after_user_created
  when "list"
    companies_in_list
    app_flow_before_user_created
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

  @logged_in_user = User.find_user(login_name)

  app_flow_after_commands

end

def app_flow_after_commands
  help_after_user_created
  puts "Enter your command"
  user_command = gets.downcase.chomp

  case user_command
  when "help"
    app_flow_after_commands
  when "logout"
    app_flow_before_user_created
  when "exit"
    abort("Thank You. Hope You made $$$$$")
  when "list"
    companies_in_list
    app_flow_after_commands
  when "list my portfolio"
    puts "Your Portfolio Companies"
    puts " "
    @logged_in_user.list_portfolio_companies.each do |company_name|
      puts "#{company_name}"
    end
    app_flow_after_commands
  when "portfolio mood"
    puts @logged_in_user.list_portfolio_sentiments
    app_flow_after_commands
  when "add company"
    add_a_company_process
  when "create company"
    create_a_company_process
  when "delete company"
    delete_a_company_process
  end
end

def delete_a_company_process
  puts "Enter company name"
  given_company_name = gets.chomp

  if @logged_in_user.companies.find_by(name:given_company_name) != nil
    @logged_in_user.delete_a_company_from_users_list(given_company_name)
    app_flow_after_commands
  else @logged_in_user.companies.find_by(name:given_company_name) == nil
    puts "Company doesn't exist in Your portfolio"
    puts "Check your list"
    companies_in_list
    app_flow_after_commands
  end
end

def create_a_company_process
  puts "Enter company name"
  given_company_name = gets.chomp
  puts "Enter company ticker_symbol"
  given_ticker_symbol = gets.upcase.chomp

  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.create_and_add_new_company_to_user(given_company_name, given_ticker_symbol)
    app_flow_after_commands
  else
    puts "Company Already Exists!"
    companies_in_list
    app_flow_after_commands
  end
end

def add_a_company_process
  puts "Enter company name"
  given_company_name = gets.chomp
  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.add_a_company_from_the_list(given_company_name)
    app_flow_after_commands
  else
    puts "Wrong Company Name, check for case sestivity"
    companies_in_list
    add_a_company_process
  end
end

app_flow_before_user_created
