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

require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should have_many(:comments) }
end
