require 'spec_helper'

describe Transaction do
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
