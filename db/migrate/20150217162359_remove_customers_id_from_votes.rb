class RemoveCustomersIdFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :customer_id, :integer
  end
end
