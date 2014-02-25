require "spec_helper"

describe Hi5Mailer do
  include SmsSpec::Helpers

  # let(:mail) { Hi5Mailer.welcome_redeemer(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  # function: "recycler", first_name: "Willie", last_name: "Mays",
  # password: "recycler1",password_confirmation: "recycler1", radius: 8,
  # address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" ) )}

  describe "welcome_redeemer" do

    let(:mail) { Hi5Mailer.welcome_redeemer(User.create(username: "recycler1",
      email: "spencereldred@yahoo.com", phone: "8082803758",
      function: "recycler", first_name: "Willie", last_name: "Mays",
      password: "recycler1",password_confirmation: "recycler1", radius: 8,
      address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" ) )}

    it "renders the headers" do
      mail.subject.should eq("Welcome to Hi5 Exchange")
    end

    it "sends to the right address" do
      mail.to.should eq(["spencereldred@yahoo.com"])
    end

    it "sends from the right address" do
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Aloha")
    end
  end

  describe "second welcome_redeemer" do
    let(:mail) { Hi5Mailer.welcome_redeemer(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" ) )}

    subject { Hi5Mailer.welcome_redeemer(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" ) )}

    # it { should deliver_to( "spencereldred@yahoo.com" ) }
    # # it { should reply_to 'hello@whatever.com' }
    # it { should deliver_from( "eldredspencer@gmail.com" ) }
    # # it { should bcc_to('secret@whatever.com') }
    # it { should have_subject( "Welcome to Hi5 Exchange" ) }
    # it { should have_body_text( "Aloha" ) }
  end

  describe "welcome_recycler" do
    let(:mail) { Hi5Mailer.welcome_recycler(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" )) }

    it "renders the headers" do
      mail.subject.should eq("Welcome to Hi5 Exchange")
    end

    it "sends to the right address" do
      mail.to.should eq(["spencereldred@yahoo.com"])
    end

    it "sends from the right address" do
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Aloha")
    end
  end

  describe "selected" do
    let(:mail) { Hi5Mailer.selected(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" )) }

    it "renders the headers" do
      mail.subject.should eq("Hi5 Exchange: Recycle job has been selected")
    end

    it "sends to the right address" do
      mail.to.should eq(["spencereldred@yahoo.com"])
    end

    it "sends from the right address" do
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Aloha")
    end
  end

  describe "completed" do
    let(:mail) { Hi5Mailer.completed(User.create(username: "recycler1", email: "spencereldred@yahoo.com", phone: "8082803758",
  function: "recycler", first_name: "Willie", last_name: "Mays",
  password: "recycler1",password_confirmation: "recycler1", radius: 8,
  address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768" )) }

    it "renders the headers" do
      mail.subject.should eq("Hi5 Exchange: Recycle job has been completed")
    end

    it "sends to the right address" do
      mail.to.should eq(["spencereldred@yahoo.com"])
    end

    it "sends from the right address" do
      mail.from.should eq(["eldredspencer@gmail.com"])
    end


    it "renders the body" do
      mail.body.encoded.should match("Aloha")
    end
  end

  describe "with no user" do
    let(:mail) { Hi5Mailer.completed(User.new) }

    it "should not have a destination address" do
      mail.to.should eq([])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end
  end

end
