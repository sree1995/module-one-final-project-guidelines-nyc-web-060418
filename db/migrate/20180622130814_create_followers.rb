class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :user_id
      t.integer :analyst_id
    end
  end
end

class CreatePortfoliosTable < ActiveRecord::Migration[5.0]
  def change

  end
end