class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.integer :votes
      t.integer :status_id
      t.integer :category_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
