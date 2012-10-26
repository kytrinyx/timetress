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
  end
end
