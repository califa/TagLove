class ImagesUsers < ActiveRecord::Migration
  def up

  	create_table :images_users, :id => false do |t|
 		t.references :images, :users
	end

	add_index :images_users, [:image_id, :user_id]

  end

  def down
  end
end
