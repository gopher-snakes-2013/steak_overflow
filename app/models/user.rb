require 'bcrypt'

class User < ActiveRecord::Base
  has_many :topics
  attr_accessible :username, :password

  validates :username,
    presence: true,
    uniqueness: true,
    length: { minimum: 6 }

  validates :password_digest,
    presence: true

  validates :password,
    length: { minimum: 6 }

  has_secure_password
end
