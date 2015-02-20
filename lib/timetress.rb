require 'date'
require "timetress/version"
require "timetress/easter"
require "timetress/holiday"
require "timetress/workday"

require 'timetress/norway'
require 'timetress/usa'
require 'timetress/scotland'

module Timetress
  class BeMoreSpecific < RuntimeError; end
  class AmbiguousHolidayError < StandardError; end

  extend Timetress::Holiday

end
