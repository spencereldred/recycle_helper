require 'spec_helper'

describe Transaction do
  describe "Transaction responds to" do
    before { @transaction = Transaction.new(
    recycler_user_id: "1", plastic: "1 bag", glass: "1 bag", cans: "1 bag", other: "cardboard",
    address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768",
    selected: false, completed: false) }

    subject { @transaction }

    it { should respond_to(:recycler_user_id) }
    it { should respond_to(:plastic) }
    it { should respond_to(:glass) }
    it { should respond_to(:cans) }
    it { should respond_to(:other) }
    it { should respond_to(:address) }
    it { should respond_to(:city) }
    it { should respond_to(:state) }
    it { should respond_to(:zipcode) }

    describe "when recycler_user_id is not present" do
      before { @transaction.recycler_user_id = ""}
      it{ should_not be_valid}
    end

    describe "when plastic is not present" do
      before { @transaction.plastic = ""}
      it{ should_not be_valid}
    end

    describe "when glass is not present" do
      before { @transaction.glass = ""}
      it{ should_not be_valid}
    end

    describe "when cans is not present" do
      before { @transaction.cans = ""}
      it{ should_not be_valid}
    end

    describe "when other  is not present" do
      before { @transaction.other = ""}
      it{ should_not be_valid}
    end

    describe "when address is not present" do
      before { @transaction.address = ""}
      it{ should_not be_valid}
    end

    describe "when city is not present" do
      before { @transaction.city = ""}
      it{ should_not be_valid}
    end

    describe "when state is not present" do
      before { @transaction.state = ""}
      it{ should_not be_valid}
    end

    describe "when zipcode is not present" do
      before { @transaction.zipcode = ""}
      it{ should_not be_valid}
    end

  end
  describe "Transaction validates presence of" do
    it { should validate_presence_of(:recycler_user_id) }
    it { should validate_presence_of(:plastic) }
    it { should validate_presence_of(:glass) }
    it { should validate_presence_of(:cans) }
    it { should validate_presence_of(:other) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
  end
end
