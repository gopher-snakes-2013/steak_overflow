require 'spec_helper'

feature 'User can sign in and sign out' do

  let(:user_attrs) { { username: 'carter', password: 'password' } }
  let!(:user){User.create(user_attrs)}

  scenario 'when clicks sign in' do
    visit new_session_path
    expect(page).to have_content('Sign In')
  end

  it "user fills in vaild username and password" do
    visit new_session_path
    fill_in('session[username]', :with => user_attrs[:username])
    fill_in('session[password]', :with => user_attrs[:password])
    click_button('Sign In')
    expect(current_path).to eq (root_path)
  end

  it "user fills in invaild username and password" do
    visit new_session_path
    fill_in('session[username]', :with => 'wrong')
    fill_in('session[password]', :with => 'wrong')
    click_button('Sign In')
    expect(current_path).to eq (new_session_path)
  end

  it "user can sign out" do

  end
end
