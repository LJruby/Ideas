class AddAttachmentAttachmentToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :ideas, :attachment
  end
end
