require "spec_helper"

describe Hi5Mailer do
  describe "welcome_user" do
    let(:mail) { Hi5Mailer.welcome_user(User.new) }

    it "renders the headers" do
      mail.subject.should eq("Welcome to Hi5 Exchange")
      # mail.to.should eq(["@user.email"])
      mail.to.should eq([])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hey")
    end
  end

  describe "created" do
    let(:mail) { Hi5Mailer.created }

    it "renders the headers" do
      mail.subject.should eq("Created")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "selected" do
    let(:mail) { Hi5Mailer.selected }

    it "renders the headers" do
      mail.subject.should eq("Selected")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "closed" do
    let(:mail) { Hi5Mailer.closed }

    it "renders the headers" do
      mail.subject.should eq("Closed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
