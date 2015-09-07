require './test/test_helper'
require 'timetress/workday'

module Somewhere
  extend Timetress::Workday

  class << self
    def official_holidays(year)
      [Date.new(year, 3, 14)]
    end
  end
end

class WorkdayTest < Minitest::Test
  def test_weekends_are_not_workdays
    assert !Somewhere.workday?(Date.new(2012, 9, 29))
    assert !Somewhere.workday?(Date.new(2012, 9, 30))
  end

  def test_holidays_are_not_workdays
    assert !Somewhere.workday?(Date.new(2012, 3, 14))
  end

  def test_regular_humdrum_days_are_workdays
    (1..5).each do |i|
      assert Somewhere.workday?(Date.new(2012, 10, i))
    end
  end

  def test_weekends_are_off
    assert Somewhere.day_off?(Date.new(2012, 9, 29))
    assert Somewhere.day_off?(Date.new(2012, 9, 30))
  end

  def test_holidays_are_off
    Somewhere.day_off?(Date.new(2012, 3, 14))
  end

  def test_weekdays_are_not_off
    (1..5).each do |i|
      assert !Somewhere.day_off?(Date.new(2012, 10, i))
    end
  end
end

class NthWorkdayTest < Minitest::Test
  def wednesday
    Date.new(2011, 2, 9)
  end

  def friday
    Date.new(2011, 2, 11)
  end

  def saturday
    Date.new(2011, 2, 12)
  end

  def sunday
    Date.new(2011, 2, 13)
  end

  def monday
    Date.new(2011, 2, 14)
  end

  def test_nth_workday_before_in_same_week
    assert_equal wednesday, Somewhere.nth_workday_before(2, friday)
  end

  def test_nth_workday_before_spans_weekends
    assert_equal friday, Somewhere.nth_workday_before(1, monday)
  end

  def test_nth_workday_before_works_on_the_weekend
    assert_equal wednesday, Somewhere.nth_workday_before(4, sunday)
  end

  def test_nth_workday_after_in_same_week
    assert_equal friday, Somewhere.nth_workday_after(2, wednesday)
  end

  def test_nth_workday_after_spans_weekends
    assert_equal monday, Somewhere.nth_workday_after(3, wednesday)
  end

  def test_nth_workday_after_works_on_the_weekend
    assert_equal monday, Somewhere.nth_workday_after(1, saturday)
  end
end
