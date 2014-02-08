require 'spec_helper'

describe "Site Pages" do

  describe 'landing page' do
    it 'welcomes the user' do
      visit root_path
      page.should have_content('Welcome to Hi5 Exchange')
      page.should have_content('Sign In')
    end
    it 'has h2 selector' do
      visit root_path
      page.should have_selector('h2')
    end
  end

  describe 'login modal' do
    xit 'login modal should have content' do
      visit root_path
      click_button "Sign In"
      page.should have_content('Hi5 Exchange Login')
    end
  end

end