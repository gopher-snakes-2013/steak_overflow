require 'spec_helper'

describe TopicsController do
  it "#index" do
      get :index
      response.status.should eq(200)
  end
  it "#new" do
    get :new
    response.status.should eq(200)
  end

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
    it "creates a topic with a user" do
      user = User.create(username: "joe", password: "secure")
      session[:user_id] = user.id
      post :create, topic: {title: "Ryan", content: "The best"}
      expect(Topic.first.user_id).to eq(1)
    end
  end

  context "#edit" do
    before :each do
      @user = User.create(username: "r", password: "pw")
      @topic = Topic.create(title: "hello", content: "this is content", user_id: @user.id)
    end
    it "go to edit page" do
      get :edit, id: @topic.id 
      response.status.should eq(200)
    end
    it "edit topic" do
      post :update, id: @topic.id, topic: {title: "NOT HELLO", content: "THIS IS CONTENT"}
      expect(Topic.find(@topic.id).title).to eq("NOT HELLO")
    end
  end
end 