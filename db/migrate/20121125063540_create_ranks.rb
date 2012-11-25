class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :rank
      t.integer :points

      t.timestamps
    end
  end
end
