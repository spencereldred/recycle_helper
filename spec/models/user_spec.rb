require 'spec_helper'

describe User do
  describe "respond to" do
    before { @user = User.new(
    username: "recycler100", email: "spencereldred@yahoo.com", phone: "8082803758",
    function: "recycler", first_name: "Willie", last_name: "Mays",
    password: "recycler100",password_confirmation: "recycler100", radius: 10,
    address: "183 Pukulani St.", city: "Makawao", state: "HI", zipcode: "96768") }

    subject { @user }

    it { should respond_to(:username)}
    it { should respond_to(:function)}
    it { should respond_to(:first_name)}
    it { should respond_to(:last_name)}
    it { should respond_to(:address)}
    it { should respond_to(:city)}
    it { should respond_to(:state)}
    it { should respond_to(:zipcode)}
    it { should respond_to(:email)}
    it { should respond_to(:phone)}
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:radius) }

    it { should be_valid }

    describe "when username is not present" do
      before { @user.username = ""}
      it{ should_not be_valid}
    end

    describe "when function is not present" do
      before { @user.function = ""}
      it{ should_not be_valid}
    end

    describe "when first_name is not present" do
      before { @user.first_name = ""}
      it{ should_not be_valid}
    end

    describe "when last_name is not present" do
      before { @user.last_name = ""}
      it{ should_not be_valid}
    end

    describe "when address is not present" do
      before { @user.address = ""}
      it{ should_not be_valid}
    end

    describe "when city is not present" do
      before { @user.city = ""}
      it{ should_not be_valid}
    end

    describe "when state is not present" do
      before { @user.state = ""}
      it{ should_not be_valid}
    end

    describe "when zipcode is not present" do
      before { @user.zipcode = ""}
      it{ should_not be_valid}
    end

    describe "when email is not present" do
      before { @user.email = ""}
      it{ should_not be_valid}
    end

    describe "when phone is not present" do
      before { @user.phone = ""}
      it{ should be_valid}
    end

    describe "when radius is not present" do
      before { @user.radius = nil }
      it{ should_not be_valid}
    end

    describe "when radius is to short" do
      before { @user.radius = 0}
      it{ should_not be_valid}
    end

    describe "when radius is too long" do
      before { @user.radius = 21}
      it{ should_not be_valid}
    end

    describe "when username is too long" do
      before { @user.username = "a" * 51 }
      it{ should_not be_valid}
    end

    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

    it { should respond_to(:authenticate) }

    describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                       foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).not_to be_valid
        end
      end
    end

    describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
      end
    end

    describe "when email address is already taken" do
      before do
        user_with_same_email = @user.dup
        user_with_same_email.save
      end

      it { should_not be_valid }
    end

    describe "when username address is already taken" do
      before do
        user_with_same_username = @user.dup
        user_with_same_username.save
      end

      it { should_not be_valid }
    end

  end

  describe "User validates presence of" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:function) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:email) }
    it { should_not validate_presence_of(:phone) }
  end
end
