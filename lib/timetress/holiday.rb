module Timetress
  module Holiday

    JANUARY = 1
    FEBRUARY = 2
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

    def official_holidays(year)
      raise NotImplementedError
    end

    private

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

    def method_missing(method, *args, &block)
      if method.to_s =~ /^next_(.*)$/
        next_holiday($1, args.first)
      elsif method.to_s =~ /(.*)_for_season/
        holiday_for_season($1, *args)
      else
        super
      end
    end
  end
end
