require "spec_helper"

describe Hi5Mailer do
  describe "welcome_user" do
    let(:mail) { Hi5Mailer.welcome_user }

    it "renders the headers" do
      mail.subject.should eq("Welcome user")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "created" do
    let(:mail) { Hi5Mailer.created }

    it "renders the headers" do
      mail.subject.should eq("Created")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
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
      mail.from.should eq(["from@example.com"])
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
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
