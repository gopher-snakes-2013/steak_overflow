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

require 'spec_helper'

describe Comment do
  it { should belong_to(:topic) }
  it { should validate_presence_of(:text) }
end
