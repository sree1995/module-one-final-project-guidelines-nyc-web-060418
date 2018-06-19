class CreatePortfoliosTable < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolios do |t|
      t.string :user
      t.string :company
    end
  end
end
