require 'spec_helper'


feature "Guest can sign up" do
  before :each do
    visit root_path
    click_on "Sign Up"
  end

  scenario "Guest clicks on sign up on homepage" do
    expect(current_path).to eq(new_user_path)
  end

  context "Guest enters in their name and password" do

    before(:each) do
      fill_in("user_username", :with => "Salarar")
      fill_in("user_password", :with => "sucksalot")
      click_button('Sign Up!')
    end

    it "should reload the home page" do
      expect(current_path).to eq(root_path)
    end

    it "and won't see the sign up button" do
      expect(page).to_not have_link("Sign Up")
    end

    it "and won't see the sign in button" do
      expect(page).to_not have_link("Sign In")
    end

  end

  context "Guest enters in invalid information" do

  end

end

