class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  has_many :ranks
  has_many :tags, :through => :ranks
  has_many :uploads, :foreign_key => :uploader_id, :class_name => "Image"
  has_and_belongs_to_many :images

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   					uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }, presence: true, format: { with: /^[a-zA-Z\d ]*$/i, :message => "can only contain letters and numbers"}
  validates :password, presence: true, length: { minimum: 6 }


#  before_destroy {|user| user.images.clear}

  def find_rank(tag)
    self.ranks.where(:tag_id => tag.id)
  end


  def edit_rank(tag, points)
    if self.find_rank(tag).empty?
      self.ranks.create(:tag_id => tag.id)
    end

    # Add points
    rank = self.find_rank(tag).first
    rank.points = rank.points.to_i + points
    rank.save
  end

end
