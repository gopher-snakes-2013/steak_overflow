class Topic < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  has_many :comments
  validates_presence_of :title, :content
  belongs_to :user
end
