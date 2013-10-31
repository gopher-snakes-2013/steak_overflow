require 'spec_helper'

feature "Guest can sign up" do
  before :each do
    visit root_path
    click_on "Sign Up"
  end

  scenario "Guest clicks on sign up on homepage" do
    expect(current_path).to eq(new_user_path)
  end

  scenario "Guest enters in their name and password" do
    fill_in("user_username", :with => "Salar")
    fill_in("user_password", :with => "sucks")
    click_button('Sign Up!')
    expect(current_path).to eq(root_path)
  end
end