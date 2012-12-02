class CreateImagesUsers < ActiveRecord::Migration
  def change
    create_table :images_users do |t|
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
