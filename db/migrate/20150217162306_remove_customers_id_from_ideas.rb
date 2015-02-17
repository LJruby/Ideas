class RemoveCustomersIdFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :customer_id, :integer
  end
end
