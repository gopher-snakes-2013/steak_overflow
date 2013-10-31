require 'spec_helper'

feature 'User can sign in' do

  let(:user){User.create(username: 'carter', password: 'password')}

  scenario 'when clicks sign in' do
    visit new_session_path
    expect(page).to have_content('Sign In')
  end

  it "user fills in vaild username and password" do
    visit new_session_path
    fill_in('session[username]', :with => user.username)
    fill_in('session[password]', :with => user.password)
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

  
end
