class CreatImagesUsers < ActiveRecord::Migration
  def change
    create_table :images_users do |t|
      t.integer :image_id
      t.integer :user_id
    end
  end
end

