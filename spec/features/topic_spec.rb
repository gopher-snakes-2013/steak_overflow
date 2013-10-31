require 'spec_helper'

feature "New topic page" do
  before :each do
    visit new_topic_path
  end

  it "topic creation lands on homepage" do
    fill_in("topic[title]", :with => "Moooooar")
    fill_in("topic[content]", :with => "eat things")
    click_button('Cook!')
    expect(current_path).to eq("/")
  end

  it "home button sends you back to the root" do
    click_link("Home")
    expect(current_path).to eq("/")
  end

end

feature 'Comments' do

  let!(:topic) { Topic.new(title: "TEST", content: "Bacon and eggs plz")}

  it "can visit the topic's page" do
    visit topic_path(@topic.id)
    expect(current_path).to eq("topics/#{@topic.id}")
  end

end