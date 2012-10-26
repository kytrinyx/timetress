require 'timetress'

describe Timetress::Norway do
  it "responds to workday?" do
    Timetress::Norway.respond_to?(:workday?).should == true
  end
end
