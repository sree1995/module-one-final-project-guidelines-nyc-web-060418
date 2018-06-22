require 'colorize'

class User < ActiveRecord::Base
  has_many :portfolios
  has_many :companies, through: :portfolios

  has_many :followers
  has_many :analysts, through: :followers

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
      [company.name.colorize(:light_blue), company.get_sentiment, list_portfolio_analyst__mood[company.name], "$#{data[0].round}".colorize(:green), "$#{data[1].round}".colorize(:green), "$#{data[2].round}".colorize(:green), "$#{data[3].round}".colorize(:green), data[4].round.to_s.colorize(:cyan)]
    end
  end

  def list_analysts
    self.analysts.map do |analyst_instance|
      analyst_instance.name
    end
  end

  def add_a_analyst_from_the_list(analyst_name)
    self.analysts << Analyst.find_by(name: analyst_name)
  end

  def create_and_add_new_analyst_to_user(analyst_name, given_twitter_id)
    new_analyst = Analyst.create(name: analyst_name, twitter_id: given_twitter_id)
    add_a_analyst_from_the_list(new_analyst.name)
  end

  def delete_a_analyst_from_users_list(analyst_name)
    analyst_found = Analyst.find_by(name: analyst_name)
    self.analysts.delete(analyst_found)
  end

  def list_portfolio_analyst__mood
    hash = {}
    self.companies.each do |company|
      hash[company.name] = 0
      count = 0
      self.analysts.each do |analyst|
          hash[company.name] += analyst.get_sentiment(company.name, company.ticker_symbol)[0..-2].to_i
          count += 1
      end
      hash[company.name] = "#{hash[company.name]/count}%"
    end
    hash
  end

  ##

  def portfolio_and_analyst
    self.companies.map do |company|
        [company.name, company.get_sentiment, list_portfolio_analyst__mood[company.name], "$#{company.stock_close.round}", "$#{company.stock_open.round}", "$#{company.stock_high.round}", "$#{company.stock_low.round}", company.stock_volume.round]
    end
  end

end
