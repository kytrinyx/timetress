require './test/test_helper'
require 'timetress'

class NorwayWorkdayTest < Minitest::Test
  def test_responds_to_workday
    assert Timetress::Norway.respond_to?(:workday?)
  end
end

