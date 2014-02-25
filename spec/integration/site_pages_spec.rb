require 'spec_helper'
require 'sessions_helper'

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

  describe 'transaction/index page' do
    before { @user = User.new(
    username: "redeemer1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "redeemer1",password_confirmation: "redeemer1", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768") }

    it "initiate a new transction" do
      sign_in(@user)
      visit transactions_path
      page.should have_content('New Transaction for')
    end
  end

  describe 'redeemers/index page' do
    before { @user = User.new(
    username: "redeemer1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "redeemer1",password_confirmation: "redeemer1", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768") }

    it "initiate a new transction" do
      sign_in(@user)
      visit redeemers_path
      page.should have_content('All Available')
    end
  end

  # describe 'login modal' do
  #   it 'login modal should have content' do
  #     visit root_path
  #     click_button "Sign In"
  #     page.should have_content('Hi5 Exchange Login')
  #   end
  # end

end