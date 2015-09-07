require './test/test_helper'
require 'timetress'

class ScottishHolidaysTest < Minitest::Test
  def test_inherits_common_holidays
    assert_equal Date.new(2011, 1, 1), Timetress::Scotland.new_years_day(2011)
  end

  def test_new_year_holiday
    assert_equal Date.new(2013, 1, 2),
                 Timetress::Scotland.new_year_holiday(2013)
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

  def test_victoria_holiday
    assert_equal Date.new(2014, 5, 26), Timetress::Scotland.spring_holiday(2014)
  end

  def test_summer_holiday
    assert_equal Date.new(2014, 8, 4), Timetress::Scotland.summer_holiday(2014)
  end

  def test_st_andrews_day
    assert_equal Date.new(2014, 11, 30),
                 Timetress::Scotland.st_andrews_day(2014)
  end

  # def test_st_andrews_on_a_saturday
  #  assert_equal Date.new(2013, 12, 2),
  #               Timetress::Scotland.st_andrews_day(2013)
  # end

  def test_royal_proclamation_for_weekday
    assert_equal Date.new(2014, 8, 20),
                 Timetress::Scotland.royal_proclamation(Date.new(2014, 8, 20))
  end

  def test_royal_proclamation_for_saturday_holiday
    assert_equal Date.new(2014, 8, 25),
                 Timetress::Scotland.royal_proclamation(Date.new(2014, 8, 23))
  end

  def test_royal_proclamation_for_sunday_holiday
    assert_equal Date.new(2014, 8, 25),
                 Timetress::Scotland.royal_proclamation(
                   Date.new(2014, 8, 24))
  end

  def test_royal_proclamation_for_boxing_day_on_sunday
    assert_equal Date.new(2010, 12, 28),
                 Timetress::Scotland.royal_proclamation(
                   Date.new(2010, 12, 26))
  end

  def test_royal_proclamation_for_jan_2_on_sunday
    assert_equal Date.new(2011, 1, 4),
                 Timetress::Scotland.royal_proclamation(Date.new(2011, 1, 2))
  end

  # Reference: http://www.scotland.gov.uk/Topics/People/bank-holidays/banks-holidays2010
  def test_bank_holidays_2010
    bank_holidays_2010 = [
      Date.new(2010, 1, 1),
      Date.new(2010, 1, 4),
      Date.new(2010, 4, 2),
      Date.new(2010, 5, 3),
      Date.new(2010, 5, 31),
      Date.new(2010, 8, 2),
      Date.new(2010, 11, 30),
      Date.new(2010, 12, 27),
      Date.new(2010, 12, 28)
    ]
    assert_equal bank_holidays_2010, Timetress::Scotland.bank_holidays(2010)
  end

  # Reference: http://www.scotland.gov.uk/Topics/People/bank-holidays/banks-holidays2010
  def test_bank_holidays_2011
    bank_holidays_2011 = [
      Date.new(2011, 1, 3),
      Date.new(2011, 1, 4),
      Date.new(2011, 4, 22),
      Date.new(2011, 5, 2),
      Date.new(2011, 5, 30),
      Date.new(2011, 8, 1),
      Date.new(2011, 11, 30),
      Date.new(2011, 12, 26),
      Date.new(2011, 12, 27)
    ]
    assert_equal bank_holidays_2011, Timetress::Scotland.bank_holidays(2011)
  end

  # Reference: http://www.scotland.gov.uk/Topics/People/bank-holidays/banks-holidays2010
  def test_bank_holidays_2012
    bank_holidays_2012 = [
      Date.new(2012, 1, 2),
      Date.new(2012, 1, 3),
      Date.new(2012, 4, 6),
      Date.new(2012, 5, 7),
      Date.new(2012, 6, 4),
      Date.new(2012, 8, 6),
      Date.new(2012, 11, 30),
      Date.new(2012, 12, 25),
      Date.new(2012, 12, 26)
    ]
    assert_equal bank_holidays_2012, Timetress::Scotland.bank_holidays(2012)
  end
end
