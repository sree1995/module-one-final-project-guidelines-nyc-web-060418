require 'terminal-table'
require 'tty-spinner'

def main_menu
  puts " "
  puts " "
  puts "enter your command, or enter \"help\" for list of commands"
  user_command = gets.downcase.chomp

  case user_command
  when "login", '1'
    login_process
  when "create account", '2'
    create_account_process
  when "list", '3'
    companies_in_list
    main_menu
  when "help", '4'
    main_help_menu
    main_menu
  when "exit", '5'
    abort("Thank You. Hope You made $$$$$")
  else
    puts "Invalid command"
    main_menu
  end

end

def app_flow_after_user_created(login_name)
  @logged_in_user = User.find_user(login_name)
  user_menu
end

def user_menu
  puts "Enter your command, or enter \"help\" for list of commands"
  user_command = gets.downcase.chomp
  case user_command
  when "list", '1'
    companies_in_list
    user_menu
  when "list my portfolio", '2'
    puts "Your Portfolio Companies"
    puts "------------------------"
    @logged_in_user.list_portfolio_companies.each do |company_name|
      puts "#{company_name}"
    end
    puts " "
    user_menu
  when "portfolio mood", '3'
    puts "Your Portfolios Market Mood And Stock Data"
    puts "--------------------"

    load_spinner

    puts create_portfolio_table

    load_spinner.stop

    user_menu
  when "add company", '4'
    add_a_company_process
  when "create company", '5'
    create_a_company_process
  when "delete company", '6'
    delete_a_company_process
  when "help", '7'
    user_help_menu
    user_menu
  when "logout", '8'
    main_help_menu
    main_menu
  else
    puts "Invalid Command"
    user_menu
  end
end

def create_portfolio_table
  portfolio_table = Terminal::Table.new do |t|
    t.headings = ['Company', 'Market Postivity', 'Current Price', 'Open', 'High', 'Low', 'Volume']
    t.rows = @logged_in_user.list_portfolio__mood_and_finances
  end
  portfolio_table.align_column(1, :right)
  portfolio_table.align_column(2, :right)
  portfolio_table
end

def load_spinner
  spinner = TTY::Spinner.new("[:spinner] Analyzing Tweets ...", format: :bouncing_ball)
  spinner.auto_spin
end
