class Comment < ActiveRecord::Base
  attr_accessible :text, :topic_id
  belongs_to :topic
  validates_presence_of :text
end