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

  describe "unselected" do
    let(:mail) { Hi5Mailer.unselected(User.new) }

    it "renders the headers" do
      mail.subject.should eq("Recycle job has been unselected")
      mail.to.should eq([])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "selected" do
    let(:mail) { Hi5Mailer.selected(User.new) }

    it "renders the headers" do
      mail.subject.should eq("Recycle job has been selected")
      mail.to.should eq([])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "completed" do
    let(:mail) { Hi5Mailer.completed(User.new) }

    it "renders the headers" do
      mail.subject.should eq("Recycle job has been completed")
      mail.to.should eq([])
      mail.from.should eq(["eldredspencer@gmail.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
