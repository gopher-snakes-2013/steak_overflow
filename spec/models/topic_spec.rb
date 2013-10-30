require 'spec_helper'

describe Topic do
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
end