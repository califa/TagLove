class Tag < ActiveRecord::Base
  attr_accessible :title

  has_many :tags
  has_many :users, :through => :ranks
end
