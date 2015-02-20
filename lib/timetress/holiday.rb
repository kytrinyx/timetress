module Timetress
  module Holiday

    JANUARY = 1
    FEBRUARY = 2
    MAY = 5
    JUNE = 6
    SEPTEMBER = 9
    AUGUST = 8
    NOVEMBER = 11
    DECEMBER = 12

    def new_years_day(year)
      Date.new(year, JANUARY, 1)
    end

    def valentines_day(year)
      Date.new(year, FEBRUARY, 14)
    end

    def maundy_thursday(year)
      easter_sunday(year) - 3
    end

    def good_friday(year)
      easter_sunday(year) - 2
    end

    def easter_sunday(year)
      Timetress::EASTER[year]
    end

    def easter_monday(year)
      easter_sunday(year) + 1
    end

    def ascension(year)
      easter_sunday(year) + 39
    end

    def pentecost_sunday(year)
      easter_sunday(year) + 49
    end

    def pentecost_monday(year)
      easter_sunday(year) + 50
    end

    def christmas_eve(year)
      Date.new(year, DECEMBER, 24)
    end

    def christmas(year)
      Date.new(year, DECEMBER, 25)
    end

    def boxing_day(year)
      Date.new(year, DECEMBER, 26)
    end

    def new_years_eve(year)
      Date.new(year, DECEMBER, 31)
    end

    def official_holidays(year)
      raise BeMoreSpecific.new localization_error_message
    end

    def mothersday(year)
      raise BeMoreSpecific.new localization_error_message
    end

    def fathersday(year)
      raise BeMoreSpecific.new localization_error_message
    end

    def labour_day(year)
      raise BeMoreSpecific.new localization_error_message
    end
    alias_method :labor_day, :labour_day

    def national_holiday(year)
      raise BeMoreSpecific.new localization_error_message
    end

    private

    def localization_error_message
      "Different in different countries. Try a country-specific module."
    end

    def next_holiday(holiday, given_date)
      given_date ||= Date.today

      unless given_date.respond_to?(:asctime)
        raise ArgumentError.new("#{given_date.inspect} must be a date or time object")
      end

      the_day = self.send(holiday.to_sym, given_date.year)

      if the_day < given_date
        the_day = self.send(holiday.to_sym, given_date.year + 1)
      end

      the_day
    end

    def previous_holiday(holiday, given_date)
      given_date ||= Date.today

      unless given_date.respond_to?(:asctime)
        raise ArgumentError.new("#{given_date.inspect} must be a date or time object")
      end

      the_day = self.send(holiday.to_sym, given_date.year)

      if the_day >= given_date
        the_day = self.send(holiday.to_sym, given_date.year - 1)
      end
      the_day
    end

    def method_missing(method, *args, &block)
      if method.to_s =~ /^next_(.*)$/
        next_holiday($1, args.first)
      elsif method.to_s =~ /^previous_(.*)$/
        previous_holiday($1, args.first)
      else
        super
      end
    end

    def second_sunday_in(month, year)
      second_week = Date.new(year, month, 8)
      second_week + days_til_sunday(second_week)
    end

    def third_sunday_in(month, year)
      third_week = Date.new(year, month, 15)
      third_week + days_til_sunday(third_week)
    end

    def first_monday_in(month, year)
      the_first = Date.new(year, month, 1)
      the_first + days_til_monday(the_first)
    end

    def third_monday_in(month, year)
      third_week = Date.new(year, month, 15)
      third_week + days_til_monday(third_week)
    end

    def last_monday_in(month, year)
      the_last = Date.new(year, month, -1)
      the_last - days_since_monday(the_last)
    end

    def days_since_monday(date)
      (7 - (1 - date.wday)) % 7
    end

    def days_til_sunday(date)
      -date.wday % 7
    end

    def days_til_monday(date)
      (1 - date.wday) % 7
    end
  end
end
