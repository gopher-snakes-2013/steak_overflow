# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :text, :topic_id
  belongs_to :topic
  validates_presence_of :text
end
