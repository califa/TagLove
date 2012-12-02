class RemoveTimestampsFromImagesUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :created_at
  	remove_column :users, :updated_at
  end

  def down

  end
end
