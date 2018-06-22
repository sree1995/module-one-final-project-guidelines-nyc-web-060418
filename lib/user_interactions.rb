require 'colorize'

def login_process
  puts "enter a username, or enter \".exit\" to return to main menu".colorize(:red)
  user_command = gets.chomp
  if user_command == '.exit' then exit_to_main end
  login_name = user_command
  if User.find_user(login_name) == nil
    puts "User doesn't exist!".colorize(:red)
    login_process
  else
    user_help_menu
    app_flow_after_user_created(login_name)
  end
end

def create_account_process
  puts "Enter a username to create your account, or enter \".exit\" to return to main menu".colorize(:red)
  user_command = gets.chomp
  if user_command == '.exit' then exit_to_main end
  user_name = user_command
  if User.find_user(user_name) == nil
    User.create(name: user_name)
    app_flow_after_user_created(user_name)
  else
    puts "Username taken, please enter another name".colorize(:red)
    create_account_process
  end
end

def companies_in_list
  puts "Companies listed in database".colorize(:green)
  puts "----------------------------"
  Company.all.each do |company_instance|
    puts "#{company_instance.name}"
  end
  puts "----------------------------"
end

def add_a_company_process
  puts "Enter company name, or enter \".list\" for company listing. Enter \".exit\" to return to account menu".colorize(:red)
  input = gets.chomp
  case input
  when ".list"
    companies_in_list
    add_a_company_process
  when ".exit"
    exit_to_account
  end
  company_name_input = input
  if Company.all.find_by(name:company_name_input) == nil
    puts "\nCompany not found, check for case sestivity, or create a new company entry from your account screen\n".colorize(:red)
    companies_in_list
    add_a_company_process
  elsif @logged_in_user.companies.find_by(name:company_name_input) != nil
    puts "\nCompany is already in your portfolio\n".colorize(:red)
    companies_in_list
    add_a_company_process
  else
    puts "\nCompany added to your portfolio\n".colorize(:light_blue)
    @logged_in_user.add_a_company_from_the_list(company_name_input)
    exit_to_account
  end
end

def create_a_company_process
  puts "Enter company name, or enter \".exit\" to return to account menu".colorize(:red)
  given_company_name = gets.chomp
  if given_company_name == '.exit' then exit_to_account end
  puts "Enter company ticker_symbol".colorize(:red)
  given_ticker_symbol = gets.upcase.chomp
  if given_ticker_symbol.downcase == '.exit' then exit_to_account end

  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.create_and_add_new_company_to_user(given_company_name, given_ticker_symbol)
    puts "Company Added To You List".colorize(:blue)
    user_menu
  else
    puts "Company Already Exists!"
    companies_in_list
    user_menu
  end
end

def delete_a_company_process
  puts @logged_in_user.list_portfolio_companies
  puts "Enter company name to delete it from your portfolio, or enter \".list\" to view your portfolio. Enter \".exit\" to return to account menu".colorize(:red)
  input = gets.chomp
  case input
  when ".list"
    puts @logged_in_user.list_portfolio_companies
    delete_a_company_process
  when ".exit"
    exit_to_account
  end
  given_company_name = input
  if @logged_in_user.companies.find_by(name:given_company_name) != nil
    @logged_in_user.delete_a_company_from_users_list(given_company_name)
    puts "Company Deleted".colorize(:red)
    exit_to_account
  else @logged_in_user.companies.find_by(name:given_company_name) == nil
    puts "Company doesn't exist in Your portfolio".colorize(:red)
    puts "Check your list".colorize(:red)
    puts @logged_in_user.list_portfolio_companies
    delete_a_company_process
  end
end

def exit_to_main
  main_help_menu
  main_menu
end

def exit_to_account
  user_help_menu
  user_menu
end

def add_a_analyst_process
  puts "Enter analyst name, or enter \".list\" for analyst listing. Enter \".exit\" to return to account menu".colorize(:red)
  input = gets.chomp
  case input
  when ".list"
    analysts_in_list
    add_a_analyst_process
  when ".exit"
    exit_to_account
  end
  analyst_name_input = input
  if Analyst.all.find_by(name:analyst_name_input) == nil
    puts "\nAnalyst not found, check for case sestivity, or create a new analyst entry from your account screen\n".colorize(:red)
    analysts_in_list
    add_a_analyst_process
  elsif @logged_in_user.analysts.find_by(name:analyst_name_input) != nil
    puts "\nAnalyst is already in your portfolio\n".colorize(:red)
    analysts_in_list
    add_a_analyst_process
  else
    puts "\nAnalyst added to your list\n".colorize(:light_blue)
    @logged_in_user.add_a_analyst_from_the_list(analyst_name_input)
    exit_to_account
  end
end



def analysts_in_list
  puts "Analysts listed in database".colorize(:green)
  puts "----------------------------"
  Analyst.all.each do |analyst_instance|
    puts "#{analyst_instance.name}"
  end
  puts "----------------------------"
end




def create_a_analyst_process
  puts "Enter analyst name, or enter \".exit\" to return to account menu".colorize(:red)
  given_analyst_name = gets.chomp
  if given_analyst_name == '.exit' then exit_to_account end
  puts "Enter Analyst twitter_id".colorize(:red)
  given_twitter_id = gets.chomp
  if given_twitter_id.downcase == '.exit' then exit_to_account end

  if @logged_in_user.analysts.find_by(name:given_analyst_name) == nil
    @logged_in_user.create_and_add_new_analyst_to_user(given_analyst_name, given_twitter_id)
    puts "Analyst Added To You List".colorize(:blue)
    user_menu
  else
    puts "Analyst Already Exists!"
    analysts_in_list
    user_menu
  end
end

def delete_a_analyst_process
  puts @logged_in_user.list_analysts
  puts "Enter analyst name to delete it from your portfolio, or enter \".list\" to view your portfolio. Enter \".exit\" to return to account menu".colorize(:red)
  input = gets.chomp
  case input
  when ".list"
    puts @logged_in_user.list_analysts
    delete_a_analyst_process
  when ".exit"
    exit_to_account
  end
  given_analyst_name = input
  if @logged_in_user.analysts.find_by(name:given_analyst_name) != nil
    @logged_in_user.delete_a_analyst_from_users_list(given_analyst_name)
    exit_to_account
  else @logged_in_user.analysts.find_by(name:given_analyst_name) == nil
    puts "Analyst doesn't exist in Your portfolio".colorize(:red)
    puts "Check your list".colorize(:red)
    puts @logged_in_user.list_analysts
    delete_a_analyst_process
  end
end
