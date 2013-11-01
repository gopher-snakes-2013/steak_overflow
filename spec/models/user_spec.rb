require 'spec_helper'

describe User do
  it { should validate_presence_of :username }
  it { should validate_presence_of :password_digest }
  it { should have_many :topics }
end
