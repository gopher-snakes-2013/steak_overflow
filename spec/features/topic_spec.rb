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

  let!(:topic) { Topic.create(title: "TEST", content: "Bacon and eggs plz")}
  let!(:topic2) { Topic.create(title: "Sumpin Else", content: "Thomas is awesome")}
  let!(:other_comment) {
    Comment.create(text: "This is stupid", topic_id: topic2.id)
    Comment.where(topic_id: topic2.id).first.text }

  it "can visit the topic's page" do
    visit topic_path(topic.id)
    expect(current_path).to eq("/topics/#{topic.id}")
  end

  it "can create a comment on a topic" do
    visit topic_comments_path(topic.id)
    fill_in("comment[text]", :with => "that's a great idea")
    click_button("Comment")
    expect(page).to_not have_content(other_comment)
  end
end

feature "User topics page:" do

  let!(:user1) { User.create(
    username: 'carter',
    password: 'password')}
  let!(:topic) { Topic.create(
    title: "TEST",
    content: "Bacon and eggs plz",
    user_id: user1.id)}

  before(:each) do
    visit root_path
    click_on "Sign In"
    fill_in("session_username", with: user1.username)
    fill_in("session_password", with: user1.password)
    click_button("Sign In!")
  end

  context 'logged in user' do
    scenario 'can edit own topic' do
      click_on "#{user1.username}"
      click_on "Edit"
      fill_in("topic[title]", :with => "Moooooar")
      fill_in("topic[content]", :with => "eat things")
      click_on "Cook!"
      click_on "Moooooar"
      expect(page).to have_content("eat things")
    end

    scenario 'can delete own topic' do
      click_on "#{user1.username}"
      click_on "Delete"
      expect(page).to_not have_content("TEST")
    end
  end
end
