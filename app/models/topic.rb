# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Topic < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  has_many :comments
  validates_presence_of :title, :content
  belongs_to :user
end
