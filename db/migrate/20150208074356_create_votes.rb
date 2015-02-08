class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :idea_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
