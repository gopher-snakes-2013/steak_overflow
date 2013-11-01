require 'spec_helper'

describe UsersController do
  it "#new" do
    get :new
    response.status.should eq(200)
  end

  context "#create" do
    it "creates a new user in the database" do
      expect {
        post :create, user: { username: "Brandon", password: "password" }
      }.to change { User.count }.by(1)
    end
    it "doesn't create an invalid user" do
      expect {
        post :create, user: { username:"", password:"" }
      }.to_not change { User.count }
    end
  end
end
