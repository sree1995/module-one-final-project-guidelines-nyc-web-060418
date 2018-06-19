class Portfolio < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  def self.delete_an_instance(given_user_id:, given_company_id:)
    self.all.delete_if do |portfolio_instance|
      portfolio_instance.user_id == given_user_id && portfolio_instance.company_id == given_company_id
    end
  end


end
