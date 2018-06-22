require 'colorize'

class User < ActiveRecord::Base
  has_many :portfolios
  has_many :companies, through: :portfolios

  #register a user
  def self.create_user(user_name)
    self.create(name: user_name)
  end

  def self.find_user(login_name)
    self.find_by(name: login_name)
  end


  #array of portfolio companies
  def list_portfolio_companies
    self.companies.map do |company_instance|
      company_instance.name
    end
  end

  #method adds a company from existing list
  def add_a_company_from_the_list(company_name)
    self.companies << Company.find_by(name: company_name)
  end

  #adds a new company to list
  #and the company to the users list
  def create_and_add_new_company_to_user(company_name, given_ticker_symbol)
    new_company = Company.create(name: company_name, ticker_symbol: given_ticker_symbol)
    add_a_company_from_the_list(new_company.name)
  end

  def delete_a_company_from_users_list(company_name)
    company_found = Company.find_by(name: company_name)
    self.companies.delete(company_found)
  end

  def list_portfolio__mood_and_finances



    self.companies.map do |company|
      data = company.stock_values_data
      [company.name.colorize(:light_blue), company.get_sentiment, "$#{data[0].round}".colorize(:green), "$#{data[1].round}".colorize(:green), "$#{data[2].round}".colorize(:green), "$#{data[3].round}".colorize(:green), data[4].round.to_s.colorize(:cyan)]

    end
  end

end
