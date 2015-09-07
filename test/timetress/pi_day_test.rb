require './test/test_helper'
require 'timetress'

module Timetress
  module Holiday
    def pi_day(year)
      Date.new(year, 3, 14)
    end
  end
end

class PiDayTest < Minitest::Test
  def last_pi_day
    Date.new(2010, 3, 14)
  end

  def pi_day
    Date.new(2011, 3, 14)
  end

  def next_pi_day
    Date.new(2012, 3, 14)
  end

  def test_next_pi_day_in_current_year
    assert_equal pi_day, Timetress.next_pi_day(pi_day - 1)
  end

  def test_next_pi_day_is_today
    assert_equal pi_day, Timetress.next_pi_day(pi_day)
  end

  def test_next_pi_day_in_next_year
    assert_equal next_pi_day, Timetress.next_pi_day(pi_day + 1)
  end

  def test_default_is_to_calculate_next_holiday_relative_to_today
    assert_equal Timetress.next_pi_day(Date.today), Timetress.next_pi_day
  end

  def test_next_holiday_rejects_string_input
    assert_raises ArgumentError do
      Timetress.next_pi_day('a string')
    end
  end

  def test_next_holiday_rejects_integer_input
    assert_raises ArgumentError do
      Timetress.next_pi_day(1)
    end
  end

  def test_previous_pi_day_in_current_year
    assert_equal pi_day, Timetress.previous_pi_day(pi_day + 1)
  end

  def test_previous_pi_day_is_last_year_when_today_is_pi_day
    assert_equal last_pi_day, Timetress.previous_pi_day(pi_day)
  end

  def test_previous_pi_day_in_last_year_when_pi_day_is_past
    assert_equal last_pi_day, Timetress.previous_pi_day(pi_day - 1)
  end

  def test_default_is_to_calculate_previous_holiday_relative_to_today
    assert_equal Timetress.previous_pi_day(Date.today), Timetress.previous_pi_day
  end

  def test_previous_holiday_rejects_string_input
    assert_raises ArgumentError do
      Timetress.previous_pi_day('a string')
    end
  end

  def test_previous_holiday_rejects_integer_input
    assert_raises ArgumentError do
      Timetress.previous_pi_day(1)
    end
  end
end
