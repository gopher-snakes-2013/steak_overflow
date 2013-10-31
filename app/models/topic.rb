class Topic < ActiveRecord::Base
  attr_accessible :title, :content
  validates_presence_of :title, :content
  belongs_to :user
end