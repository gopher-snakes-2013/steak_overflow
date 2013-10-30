require 'spec_helper'

describe TopicsController do
  context "#create" do
    it "creates a topic with valid params" do
      expect {
        post :create, topic: {title: "Meat", content: "It is what is for food"}
      }.to change { Topic.count }.by(1)
    end
    it "doesn't create a topic with invalid params" do
      expect {
        post :create, topic: {title: "Wrong"}
      }.to_not change { Topic.count }
    end
  end
end