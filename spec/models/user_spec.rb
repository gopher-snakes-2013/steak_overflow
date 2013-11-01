require 'spec_helper'

describe User do
  describe "username" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username) }
    it { should ensure_length_of(:username).
      is_at_least(6) }
  end

  describe "password" do
    it { should validate_presence_of :password_digest }
    it { should ensure_length_of(:password).
      is_at_least(6) }
  end

  it { should have_many :topics }
end
