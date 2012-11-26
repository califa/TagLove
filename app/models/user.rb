class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  has_many :ranks
  has_many :tags, :through => :ranks
  has_many :images_as_uploader, :foreign_key => :uploader, :class_name => "Image"
  has_and_belongs_to_many :images

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  VALID_EMAIL_REGEX = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
   					uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
