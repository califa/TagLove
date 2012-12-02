class DropImagesUsers < ActiveRecord::Migration
  def up
  	drop_table :images_users
  end

  def down
  end
end
