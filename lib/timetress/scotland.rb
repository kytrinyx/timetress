require 'timetress/scotland/holiday'

module Timetress
  class AmbiguousHolidayError < StandardError; end

  module Scotland
    extend Timetress::Scotland::Holiday
    extend Timetress::Workday
  end
end
