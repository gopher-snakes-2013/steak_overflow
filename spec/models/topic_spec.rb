require 'spec_helper'

describe Topic do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should have_many(:comments) }
end