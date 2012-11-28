class Image < ActiveRecord::Base
  attr_accessible :uploader_id, :img, :tag_id

  belongs_to :tag
  belongs_to :uploader, :class_name => "User" 
  has_and_belongs_to_many :users

  has_attached_file :img,
                    :storage => :s3,
                    :s3_credentials => S3_CREDENTIALS

end
