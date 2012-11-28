class RemoveTagIdFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :tag_id
  	add_column :images, :tag_id, :integer
  end

  def down
  end
end
