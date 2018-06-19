class CreateCompaniesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ticker_symbol
    end
  end
end
