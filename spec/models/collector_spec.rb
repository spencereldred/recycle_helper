require 'spec_helper'

describe Collector do
  it { should have_many(:collector_recyclers) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:drivers_license_number) }

end
