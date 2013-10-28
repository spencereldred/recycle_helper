require 'spec_helper'

describe Transaction do
  it { should validate_presence_of(:recycler_user_id) }
  it { should validate_presence_of(:plastic) }
  it { should validate_presence_of(:glass) }
  it { should validate_presence_of(:cans) }
  it { should validate_presence_of(:other) }
end
