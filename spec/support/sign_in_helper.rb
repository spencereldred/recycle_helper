module AuthenticationHelper

  def sign_in
    user = User.create( username: "redeemer1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "redeemer", first_name: "John", last_name: "Brodie",
  password: "redeemer1",password_confirmation: "redeemer1", radius: 8,
  address: "2741 Leolani Place", city: "Makawao", state: "HI", zipcode: "96768")
    # visit login_path
    post sessions_path, { username: "redeemer1", password: "redeemer1"}
    follow_redirect!

    # fill_in :username, with: "redeemer1"
    # fill_in :password, with: "redeemer1"
    # click_button "Submit"
  end
end

RSpec.configure do |c|
  c.include AuthenticationHelper
end
