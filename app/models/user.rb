require 'bcrypt'

class User < ActiveRecord::Base
  has_many :topics
  attr_accessible :username, :password
  
  has_secure_password
  validates_presence_of :username, :password_digest
end
