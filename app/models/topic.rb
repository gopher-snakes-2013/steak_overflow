class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  has_many :comments
  validates_presence_of :title, :content
end