require './test/test_helper'
require 'timetress'

class NorwegianHolidaysTest < Minitest::Test

  def test_inherits_common_holidays
    assert_equal Date.new(2011, 1, 1), Timetress::Norway.new_years_day(2011)
  end

  def test_mothersday_is_the_second_sunday_of_february
    assert_equal Date.new(2011, 2, 13), Timetress::Norway.mothersday(2011)
  end

  def test_labour_day
    assert_equal Date.new(2011, 5, 1), Timetress::Norway.labour_day(2011)
  end

  def test_labor_day
    assert_equal Date.new(2011, 5, 1), Timetress::Norway.labor_day(2011)
  end

  def test_national_holiday
    assert_equal Date.new(2011, 5, 17), Timetress::Norway.national_holiday(2011)
  end

  def test_fathersday_is_the_second_sunday_of_november
    assert_equal Date.new(2011, 11, 13), Timetress::Norway.fathersday(2011)
  end

  # in 2012 5/17 is both the national holiday and ascension
  def test_official_holidays_do_not_appear_in_duplicate
    expected = [
      Date.new(2012, 1, 1),
      Date.new(2012, 4, 5),
      Date.new(2012, 4, 6),
      Date.new(2012, 4, 8),
      Date.new(2012, 4, 9),
      Date.new(2012, 5, 1),
      Date.new(2012, 5, 17),
      Date.new(2012, 5, 27),
      Date.new(2012, 5, 28),
      Date.new(2012, 12, 25),
      Date.new(2012, 12, 26)
    ]
    assert_equal expected, Timetress::Norway.official_holidays(2012)
  end

  def test_official_holidays_are_public_holidays
    assert_equal Timetress::Norway.official_holidays(2013), Timetress::Norway.public_holidays(2013)
  end

  def test_official_holidays_are_legal_holidays
    assert_equal Timetress::Norway.official_holidays(2013), Timetress::Norway.legal_holidays(2013)
  end

  # in 2013 ascension is before the national holiday
  def test_official_holidays_appear_in_order
    expected = [
      Date.new(2013, 1, 1),
      Date.new(2013, 3, 28),
      Date.new(2013, 3, 29),
      Date.new(2013, 3, 31),
      Date.new(2013, 4, 1),
      Date.new(2013, 5, 1),
      Date.new(2013, 5, 9),
      Date.new(2013, 5, 17),
      Date.new(2013, 5, 19),
      Date.new(2013, 5, 20),
      Date.new(2013, 12, 25),
      Date.new(2013, 12, 26)
    ]
    assert_equal expected, Timetress::Norway.official_holidays(2013)
  end

  def test_next_holiday_works
    mothersday = Date.new(2011, 2, 13)
    assert_equal mothersday, Timetress::Norway.next_mothersday(mothersday - 1)
  end

  def test_previous_holiday_works
    mothersday = Date.new(2011, 2, 13)
    assert_equal mothersday, Timetress::Norway.previous_mothersday(mothersday + 1)
  end

  def test_christmas_is_ambiguous
    assert_raises Timetress::AmbiguousHolidayError do
      Timetress::Norway.christmas(2012)
    end
  end
end
