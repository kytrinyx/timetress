require './test/test_helper'
require 'timetress'

class ScottishHolidaysTest < Minitest::Test

  def test_new_year_holiday
    assert_equal Date.new(2013, 1, 2), Timetress::Scotland.new_year_holiday(2013)
  end

  def test_may_day
    assert_equal Date.new(2013, 5, 6), Timetress::Scotland.may_day(2013)
  end

  def test_ash_wednesday
    assert_equal Date.new(2013, 2, 13), Timetress::Scotland.ash_wednesday(2013)
  end

  def test_inherits_common_holidays
    assert_equal Date.new(2012, 1, 1), Timetress::Scotland.new_years_day(2012)
  end

  def test_mothersday_is_the_fourth_sunday_of_lent
    assert_equal Date.new(2013, 3, 10), Timetress::Scotland.mothersday(2013)
  end

  def test_mothering_day
    assert_equal Date.new(2013, 3, 10), Timetress::Scotland.mothering_day(2013)
  end

  def test_fathersday
    assert_equal Date.new(2013, 6, 16), Timetress::Scotland.fathersday(2013)
  end

  def test_spring_holiday
    assert_equal Date.new(2014, 5, 26), Timetress::Scotland.spring_holiday(2014)
  end

  def test_summer_holiday
    assert_equal Date.new(2014, 8, 4), Timetress::Scotland.summer_holiday(2014)
  end

  def test_st_andrews_day
    assert_equal Date.new(2014, 11, 30), Timetress::Scotland.st_andrews_day(2014)
  end
end
