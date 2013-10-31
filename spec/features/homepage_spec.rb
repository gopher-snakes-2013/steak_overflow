require 'spec_helper'

feature "Homepage" do
  scenario "user can add a new topic" do
    visit root_path
    click_on "Add a New Cut!"
    expect(current_path).to eq(new_topic_path)
  end

  scenario "user clicks on a topic" do
    topic = Topic.create(title: "okay so steak", content: "is yummy")
    visit root_path
    click_on "okay so steak"
    expect(current_path).to eq(topic_path(topic.id))
  end
end
