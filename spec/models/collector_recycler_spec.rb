require 'spec_helper'

describe CollectorRecycler do
  it { should belong_to :collector }
  it { should belong_to :recycler }

  it { should validate_presence_of(:collector) }
  it { should validate_presence_of(:recycler) }
  it { should validate_presence_of(:glass) }
  it { should validate_presence_of(:cans) }
  it { should validate_presence_of(:bottles) }

end
