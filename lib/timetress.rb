require 'date'
require "timetress/version"
require "timetress/easter"
require "timetress/holiday"
require "timetress/workday"

require 'timetress/norway'

module Timetress
  class BeMoreSpecific < RuntimeError; end

  extend Timetress::Holiday

end
