class ImagesUsers < ActiveRecord::Migration
  def up

  	create_table :images_users, :id => false do |t|
 		t.references :images, :users
	end
  end

  def down
  end
end
