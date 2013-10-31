class Comment < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :text
end