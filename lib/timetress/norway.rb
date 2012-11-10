require 'timetress/norway/holiday'

module Timetress
  class AmbiguousHolidayError < StandardError; end

  module Norway
    extend Timetress::Norway::Holiday
    extend Timetress::Workday

  end
end
