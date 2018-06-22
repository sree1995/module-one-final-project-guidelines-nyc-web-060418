class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :company_id
      t.integer :analyst_id
    end
  end
end
