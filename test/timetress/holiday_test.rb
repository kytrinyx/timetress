require './test/test_helper'
require 'timetress'

class HolidayTest < Minitest::Test
  def test_new_years_day
    assert_equal Date.new(2011, 1, 1), Timetress.new_years_day(2011)
  end

  def test_valentines_day
    assert_equal Date.new(2011, 2, 14), Timetress.valentines_day(2011)
  end

  def test_maudy_thursday_is_the_thursday_before_easter
    assert_equal Date.new(2011, 4, 21), Timetress.maundy_thursday(2011)
  end

  def test_good_friday_is_the_friday_before_easter
    assert_equal Date.new(2011, 4, 22), Timetress.good_friday(2011)
  end

  def test_easter_sunday_is_on_a_complex_schedule
    assert_equal Date.new(2011, 4, 24), Timetress.easter_sunday(2011)
  end

  def test_easter_monday_is_the_day_after_easter
    assert_equal Date.new(2011, 4, 25), Timetress.easter_monday(2011)
  end

  def test_ascension_is_39_days_after_easter
    assert_equal Date.new(2011, 6, 2), Timetress.ascension(2011)
  end

  def test_pentecost_sunday_is_49_days_after_easter
    assert_equal Date.new(2011, 6, 12), Timetress.pentecost_sunday(2011)
  end

  def test_pentecost_monday_is_50_days_after_easter
    assert_equal Date.new(2011, 6, 13), Timetress.pentecost_monday(2011)
  end

  def test_christmas_eve
    assert_equal Date.new(2011, 12, 24), Timetress.christmas_eve(2011)
  end

  def test_boxing_day
    assert_equal Date.new(2011, 12, 26), Timetress.boxing_day(2011)
  end

  def test_new_years_eve
    assert_equal Date.new(2011, 12, 31), Timetress.new_years_eve(2011)
  end

  def test_official_holidays_are_country_specific
    assert_raises Timetress::BeMoreSpecific do
      Timetress.official_holidays(2012)
    end
  end

  [
    :mothersday, :fathersday, :labor_day, :labour_day, :national_holiday
  ].each do |holiday|
    define_method "test_#{holiday}_is_country_specific" do
      assert_raises Timetress::BeMoreSpecific do
        Timetress.send(holiday, 2012)
      end
    end
  end

  # See PiDayTest for tests regarding next_holiday and previous_holiday
end
