class User < ActiveRecord::Base
  has_many :portfolios
  has_many :companies, through: :portfolios

  #register a user
  def self.create_user(user_name)
    self.create(name: user_name)
  end

  #array of portfolio companies
  def list_portfolio_companies
    self.companies.map do |company_instance|
      company_instance.name
    end
  end

  #method adds a company from existing list
  def add_a_company_from_the_list(company_name)
    Portfolio.create(user: self, company: company_name)
  end

  #adds a new company to list
  #and the company to the users list
  def create_and_add_new_company_to_user(company_name, ticker_symbol)
    new_company = Company.create(company_name, ticker_symbol)
    add_a_company_from_the_list(create_and_add_new_company_to_user)
  end

  def delete_a_company_from_users_list(company_name)
    company_found = self.companies.find do |company_instance|
      company_instance.name == company_name
    end

    Portfolio.where(user_id: self.id, company_id: company_found.id).destroy
  end

end
