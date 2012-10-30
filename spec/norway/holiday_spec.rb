require 'timetress'

describe Timetress::Norway do

  it "has common holidays" do
    Timetress::Norway.new_years_day(2011).should eq Date.new(2011, 1, 1)
  end

  describe "Mothersday" do
    it "is on the second Sunday of February" do
      Timetress::Norway.mothersday(2011).should eq Date.new(2011, 2, 13)
    end
  end

  describe "Labour Day" do
    it "is on May 1st" do
      Timetress::Norway.labour_day(2011).should eq Date.new(2011, 5, 1)
    end

    it "is sometimes spelled without the 'u'" do
      Timetress::Norway.labor_day(2011).should eq Date.new(2011, 5, 1)
    end
  end

  describe "National holiday" do
    it "is on May 17th" do
      Timetress::Norway.national_holiday(2011).should eq Date.new(2011, 5, 17)
    end
  end

  describe "Fathersday" do
    it "is on the second Sunday of November" do
      Timetress::Norway.fathersday(2011).should eq Date.new(2011, 11, 13)
    end
  end

  describe "official holidays" do
    let(:holidays) do
      expected = [
        Date.new(2012, 1, 1),
        Date.new(2012, 4, 5),
        Date.new(2012, 4, 6),
        Date.new(2012, 4, 8),
        Date.new(2012, 4, 9),
        Date.new(2012, 5, 1),
        Date.new(2012, 5, 17),
        Date.new(2012, 5, 17), # The bastards! Cheating us of a day off.
        Date.new(2012, 5, 27),
        Date.new(2012, 5, 28),
        Date.new(2012, 12, 25),
        Date.new(2012, 12, 26)
      ]
    end

    specify "are known to us" do
      Timetress::Norway.official_holidays(2012).should eq(holidays)
    end

    specify "are also called public holidays" do
      Timetress::Norway.public_holidays(2012).should eq(holidays)
    end

    specify "are also called legal holidays" do
      Timetress::Norway.legal_holidays(2012).should eq(holidays)
    end
  end

  describe "next holiday" do
    it "works" do
      mothersday = Date.new(2011, 2, 13)
      Timetress::Norway.next_mothersday(mothersday - 1).should eq(mothersday)
    end
  end

end
