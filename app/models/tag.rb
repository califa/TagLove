class Tag < ActiveRecord::Base
  attr_accessible :title

  has_many :ranks
  has_many :users, :through => :ranks
end
