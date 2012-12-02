class Rank < ActiveRecord::Base
  attr_accessible :points, :rank, :tag_id, :user_id

  belongs_to :user
  has_one :tag

  validates :user_id, presence: true
  validates :tag_id, presence: true

end
