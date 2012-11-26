class AddAttachmentImgToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.has_attached_file :img
    end
  end

  def self.down
    drop_attached_file :images, :img
  end
end
