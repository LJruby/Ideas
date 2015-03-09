class RenameTitleInTables < ActiveRecord::Migration
  def up
		change_table :statuses do |t|
			t.rename :title, :name
		end
		change_table :categories do |t|
			t.rename :title, :name
		end
		change_table :roles do |t|
			t.rename :title, :name
		end
  end
end
