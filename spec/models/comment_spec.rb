require 'spec_helper'

describe Comment do
  it { should belong_to(:topic) }
  it { should validate_presence_of(:text) }
end
