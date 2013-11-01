require 'spec_helper'

feature 'User can sign in and sign out' do

  let(:user_attrs) { { username: 'carter', password: 'password' } }
  let!(:user){User.create(user_attrs)}

  scenario 'when clicks sign in' do
    visit new_session_path
    expect(current_path).to eq(new_session_path)
  end

  it "user fills in valid username and password" do
    visit new_session_path
    fill_in('session[username]', :with => user_attrs[:username])
    fill_in('session[password]', :with => user_attrs[:password])
    click_button('Sign In')
    expect(current_path).to eq (root_path)
  end

  it "user fills in invalid username and password" do
    visit new_session_path
    fill_in('session[username]', :with => 'wrong')
    fill_in('session[password]', :with => 'wrong')
    click_button('Sign In')
    expect(current_path).to eq (new_session_path)
  end

  it "user can log out" do
    visit new_session_path
    fill_in('session[username]', :with => user_attrs[:username])
    fill_in('session[password]', :with => user_attrs[:password])
    click_button('Sign In')
    click_link('Log Out')
    expect(page).to_not have_link("Log Out")
  end
end

feature "Guest signs in" do

  context "Guests can't see other users' pages" do

    let!(:user1){User.create({ username: 'carter', password: 'password' })}
    let!(:user2){User.create({ username: 'smartalek', password: 'password' })}


    before(:each) do
      visit root_path
      click_on "Sign In"
      fill_in("session_username", :with => 'carter')
      fill_in("session_password", :with => 'password')
      click_button("Sign In!")
    end

    it "Logged-in user can visit own page" do
      visit user_path(user1.id)
      expect(current_path).to eq(user_path(user1.id))
    end

    it "Logged-in user cannot visit other users' pages" do
      visit user_path(user2.id)
      expect(page).to_not have_content(user2.username)
    end
  end
end