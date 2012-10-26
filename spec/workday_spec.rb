require 'timetress'

module Somewhere
  extend Timetress::Workday

  class << self
    def official_holidays(year)
      [Date.new(year, 3, 14)]
    end
  end
end

describe Timetress::Workday do
  describe "#workday?" do
    it "does not coincide with weekends" do
      Somewhere.workday?(Date.new(2012, 9, 29)).should == false
      Somewhere.workday?(Date.new(2012, 9, 30)).should == false
    end

    it "does not fall on holidays" do
      Somewhere.workday?(Date.new(2012, 3, 14)).should == false
    end

    it "is just a regular, hum-drum day" do
      (1..5).each do |i|
        Somewhere.workday?(Date.new(2012, 10, i)).should == true
      end
    end
  end

  describe "#day_off?" do
    specify "Yes, if it is the weekend." do
      Somewhere.day_off?(Date.new(2012, 9, 29)).should == true
      Somewhere.day_off?(Date.new(2012, 9, 30)).should == true
    end

    specify "Certainly, when celebrating holidays." do
      Somewhere.day_off?(Date.new(2012, 3, 14)).should == true
    end

    specify "Not during the week, usually" do
      (1..5).each do |i|
        Somewhere.day_off?(Date.new(2012, 10, i)).should == false
      end
    end
  end

  describe "#nth_workday_before" do
    let(:wednesday) { Date.new(2011, 2, 9) }
    let(:friday) { Date.new(2011, 2, 11) }
    let(:sunday) { Date.new(2011, 2, 13) }
    let(:monday) { Date.new(2011, 2, 14) }

    it "works within the same week" do
      Somewhere.nth_workday_before(2, friday).should == wednesday
    end

    it "spans weekends successfully" do
      Somewhere.nth_workday_before(1, monday).should == friday
    end

    it "works within a weekend" do
      Somewhere.nth_workday_before(4, sunday).should == wednesday
    end
  end

  describe "#nth_workday_after" do
    let(:wednesday) { Date.new(2011, 2, 9) }
    let(:friday) { Date.new(2011, 2, 11) }
    let(:saturday) { Date.new(2011, 2, 12) }
    let(:monday) { Date.new(2011, 2, 14) }

    it "works within the same week" do
      Somewhere.nth_workday_after(2, wednesday).should == friday
    end

    it "spans weekends correctly" do
      Somewhere.nth_workday_after(3, wednesday).should == monday
    end

    it "works within a weekend" do
      Somewhere.nth_workday_after(1, saturday).should == monday
    end
  end

end

