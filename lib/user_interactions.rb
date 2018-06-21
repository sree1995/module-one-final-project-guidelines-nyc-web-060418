def create_account_process
  user_command = gets.chomp
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
  puts "Companies in our List"
  puts "---------------------"
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
    main_menu
  else
    user_help_menu
    app_flow_after_user_created(login_name)
  end
end

def delete_a_company_process
  puts "Enter company name"
  given_company_name = gets.chomp

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

def create_a_company_process
  puts "Enter company name"
  given_company_name = gets.chomp
  puts "Enter company ticker_symbol"
  given_ticker_symbol = gets.upcase.chomp

  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.create_and_add_new_company_to_user(given_company_name, given_ticker_symbol)
    user_menu
  else
    puts "Company Already Exists!"
    companies_in_list
    user_menu
  end
end

def add_a_company_process #crashes if invalid company name is given
  puts "Enter company name, or enter \"list\" for company listing" #list functionality not added yet
  given_company_name = gets.chomp
  if @logged_in_user.companies.find_by(name:given_company_name) == nil
    @logged_in_user.add_a_company_from_the_list(given_company_name)
    user_menu
  else
    puts "Company not found, check for case sestivity"
    companies_in_list
    add_a_company_process
  end
end
