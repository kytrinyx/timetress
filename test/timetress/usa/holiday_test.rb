require './test/test_helper'
require 'timetress'

# http://en.wikipedia.org/wiki/Public_holidays_in_the_United_States
class USHolidaysTest < Minitest::Test

  def test_inherits_common_holidays
    assert_equal Date.new(2011, 1, 1), Timetress::USA.new_years_day(2011)
  end

  def test_martin_luther_king_day_is_the_third_monday_of_january
    assert_equal Date.new(2011, 1, 17), Timetress::USA.martin_luther_king_day(2011)
  end

  def test_memorial_day_is_the_last_monday_in_may
    assert_equal Date.new(2011, 5, 30), Timetress::USA.memorial_day(2011)
  end

  def test_mothersday_is_the_second_sunday_of_may
    assert_equal Date.new(2011, 5, 8), Timetress::USA.mothersday(2011)
  end

  def test_national_holiday
    assert_equal Date.new(2011, 7, 4), Timetress::USA.national_holiday(2011)
  end

  def test_independence_day
    assert_equal Date.new(2011, 7, 4), Timetress::USA.independence_day(2011)
  end

  def test_fathersday_is_the_third_sunday_of_june
    assert_equal Date.new(2011, 6, 19), Timetress::USA.fathersday(2011)
  end

  def test_labour_day_is_the_first_monday_of_september
    assert_equal Date.new(2011, 9, 5), Timetress::USA.labour_day(2011)
    assert_equal Date.new(2014, 9, 1), Timetress::USA.labour_day(2014)
  end

  def test_labor_day
    assert_equal Date.new(2011, 9, 5), Timetress::USA.labor_day(2011)
  end

end

