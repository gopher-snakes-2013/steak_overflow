require 'spec_helper'

describe SessionsController do

  describe '#signin' do
    it 'should render a signin page' do
      visit new_session_path
      expect(page).to have_content('Sign In')
    end
  end

  
end
