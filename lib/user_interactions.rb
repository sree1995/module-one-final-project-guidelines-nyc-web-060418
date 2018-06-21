
def login_process
  puts "enter a username, or enter \".exit\" to return to main menu"
  user_command = gets.chomp
  if user_command == '.exit' then exit_to_main end
  login_name = user_command
  if User.find_user(login_name) == nil
    puts "User doesn't exist!"
    login_process
  else
    user_help_menu
    app_flow_after_user_created(login_name)
  end
end

def create_account_process
  puts "Enter a username to create your account, or enter \".exit\" to return to main menu"
  user_command = gets.chomp
  if user_command == '.exit' then exit_to_main end
  user_name = user_command
  if User.find_user(user_name) == nil
    User.create(name: user_name)
    app_flow_after_user_created(user_name)
  else
    puts "Username taken, please enter another name"
    create_account_process
  end
end

def companies_in_list
  puts "Companies listed in database"
  puts "----------------------------"
  Company.all.each do |company_instance|
    puts "#{company_instance.name}"
  end
  puts "----------------------------"
end

def add_a_company_process
  puts "Enter company name, or enter \".list\" for company listing. Enter \".exit\" to return to account menu"
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
    puts "\nCompany not found, check for case sestivity, or create a new company entry from your account screen\n"
    companies_in_list
    add_a_company_process
  elsif @logged_in_user.companies.find_by(name:company_name_input) != nil
    puts "\nCompany is already in your portfolio\n"
    companies_in_list
    add_a_company_process
  else
    puts "\nCompany added to your portfolio\n"
    @logged_in_user.add_a_company_from_the_list(company_name_input)
    exit_to_account
  end
end

def create_a_company_process
  puts "Enter company name, or enter \".exit\" to return to account menu"
  given_company_name = gets.chomp
  if given_company_name == '.exit' then exit_to_account end
  puts "Enter company ticker_symbol"
  given_ticker_symbol = gets.upcase.chomp
  if given_ticker_symbol.downcase == '.exit' then exit_to_account end

  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.create_and_add_new_company_to_user(given_company_name, given_ticker_symbol)
    user_menu
  else
    puts "Company Already Exists!"
    companies_in_list
    user_menu
  end
end

def delete_a_company_process
  puts "Enter company name to delete it from your portfolio, or enter \".list\" for company listing. Enter \".exit\" to return to account menu"
  input = gets.chomp
  case input
  when ".list"
    companies_in_list
    add_a_company_process
  when ".exit"
    exit_to_account
  end
  given_company_name = input
  if @logged_in_user.companies.find_by(name:given_company_name) != nil
    @logged_in_user.delete_a_company_from_users_list(given_company_name)
    user_menu
  else @logged_in_user.companies.find_by(name:given_company_name) == nil
    puts "Company doesn't exist in Your portfolio"
    puts "Check your list"
    companies_in_list
    user_menu
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
