class CreateAnalysts < ActiveRecord::Migration[5.0]
  def change
    create_table :analysts do |t|
      t.string :name
      t.string :twitter_id
    end
  end
end
