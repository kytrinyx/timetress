require 'timetress'

module Timetress
  module Holiday
    def pi_day(year)
      Date.new(year, 3, 14)
    end
  end
end

describe Timetress::Holiday do

  describe "New Year's Day" do
    it "is on Jan 1st" do
      Timetress.new_years_day(2011).should eq Date.new(2011, 1, 1)
    end
  end

  describe "Valentines Day" do
    it "is on Feb 14th" do
      Timetress.valentines_day(2011).should eq Date.new(2011, 2, 14)
    end
  end

  describe "Maundy Thursday" do
    it "is the Thursday before Easter" do
      Timetress.maundy_thursday(2011).should eq Date.new(2011, 4, 21)
    end
  end

  describe "Good Friday" do
    it "is the Friday before Easter" do
      Timetress.good_friday(2011).should eq Date.new(2011, 4, 22)
    end
  end

  describe "Easter Sunday" do
    it "is crazy" do
      Timetress.easter_sunday(2011).should eq Date.new(2011, 4, 24)
    end
  end

  describe "Easter Monday" do
    it "is the day after Easter Sunday" do
      Timetress.easter_monday(2011).should eq Date.new(2011, 4, 25)
    end
  end

  describe "Ascension" do
    it "is Thursday, 39 days after Easter" do
      Timetress.ascension(2011).should eq Date.new(2011, 6, 2)
    end
  end

  describe "Pentecost Sunday" do
    it "is 49 days after Easter" do
      Timetress.pentecost_sunday(2011).should eq Date.new(2011, 6, 12)
    end
  end

  describe "Pentecost Monday" do
    it "is 50 days after Easter" do
      Timetress.pentecost_monday(2011).should eq Date.new(2011, 6, 13)
    end
  end

  describe "Christmas Eve" do
    it "is on Dec 24th" do
      Timetress.christmas_eve(2011).should eq Date.new(2011, 12, 24)
    end
  end

  describe "Christmas" do
    it "is on Dec 25th" do
      Timetress.christmas(2011).should eq Date.new(2011, 12, 25)
    end
  end

  describe "Boxing Day" do
    it "is on Dec 26th" do
      Timetress.boxing_day(2011).should eq Date.new(2011, 12, 26)
    end
  end

  describe "New Year's Eve" do
    it "is on Dec 31st" do
      Timetress.new_years_eve(2011).should eq Date.new(2011, 12, 31)
    end
  end

  describe "official holidays" do
    it "must be implemented in subclass" do
      lambda { Timetress.official_holidays(2012) }.should raise_error
    end
  end

  describe "it complains helpfully about" do
    [:mothersday, :fathersday, :labor_day, :labour_day, :national_holiday].each do |holiday|
      specify holiday.to_s do
        lambda { Timetress.send(holiday, 2012) }.should raise_error /Norway/
      end
    end
  end

  describe "next pi day" do
    let(:last_pi_day) { Date.new(2010, 3, 14) }
    let(:pi_day) { Date.new(2011, 3, 14) }
    let(:next_pi_day) { Date.new(2012, 3, 14) }

    it "is on March 14th" do
      Timetress.next_pi_day(pi_day - 1).should eq(pi_day)
    end

    it "is this year if today is pi day" do
      Timetress.next_pi_day(pi_day).should eq(pi_day)
    end

    it "is next year if it's already passed" do
      Timetress.next_pi_day(pi_day + 1).should eq(next_pi_day)
    end

    it "default is relative to today" do
      Timetress::Norway.next_pi_day.should eq(Timetress::Norway.next_pi_day(Date.today))
    end

    it "rejects string input" do
      lambda { Timetress::Norway.next_pi_day("a string") }.should raise_error(ArgumentError)
    end

    it "rejects integer input" do
      lambda { Timetress::Norway.next_pi_day(1) }.should raise_error(ArgumentError)
    end

  end
end
