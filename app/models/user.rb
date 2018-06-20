class User < ActiveRecord::Base
  has_many :portfolios
  has_many :companies, through: :portfolios

  #register a user
  def self.create_user(user_name)
    self.create(name: user_name)
  end

  def self.login(login_name)
    self.find_by(login_name)
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

  #sree = User.find(1)

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

  def list_portfolio_sentiments
    self.companies.map do |company|
      "#{company.name}: #{company.get_sentiment}"
    end
  end

end
