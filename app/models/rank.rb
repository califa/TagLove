class Rank < ActiveRecord::Base
  attr_accessible :points, :rank, :tag_id, :user_id

  belongs_to :user
  belongs_to :tag

  validates :user_id, presence: true
  validates :tag_id, presence: true

	BRONZE_POINTS = 10
	SILVER_POINTS = 110
	GOLD_POINTS = 1110



 	 def points_to_percent

		points = self.points.to_f
		
		silverstart = 40
		silverlength = 62
		bronzestart = 15
		bronzelength = 25

		if (points >= GOLD_POINTS)
			return 100.to_s
		elsif (points >= SILVER_POINTS)
			silverpct = (points - SILVER_POINTS) / (GOLD_POINTS - SILVER_POINTS) * 100 
			return (silverstart + (silverpct / 100 * silverlength))
		elsif (points >= BRONZE_POINTS)
			bronzepct = (points - BRONZE_POINTS) / (SILVER_POINTS - BRONZE_POINTS) * 100 
			return (bronzestart + (bronzepct / 100 * bronzelength)).to_s
		else
			nonepct = (points / BRONZE_POINTS * 100)
			return (nonepct / 100 * bronzestart).to_s
		end
	end

	def points_to_rank

		points = self.points

		if points >= GOLD_POINTS
			return "gold"
		elsif points >= SILVER_POINTS
			return "silver"
		elsif points >= BRONZE_POINTS
			return "bronze"
		else
			return ""
		end
	end

end
