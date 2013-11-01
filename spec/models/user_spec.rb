# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :password_digest }
  it { should have_many :topics }
end
