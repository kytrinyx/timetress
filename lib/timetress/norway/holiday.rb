module Timetress
  module Norway
    module Holiday
      include Timetress::Holiday

      def mothersday(year)
        second_sunday_in(FEBRUARY, year)
      end

      def fathersday(year)
        second_sunday_in(NOVEMBER, year)
      end

      def labour_day(year)
        Date.new(year, MAY, 1)
      end
      alias_method :labor_day, :labour_day

      def national_holiday(year)
        Date.new(year, MAY, 17)
      end

      def christmas(_year)
        raise AmbiguousHolidayError.new("Do you mean `christmas_eve` or `first_day_of_christmas`?")
      end

      def first_day_of_christmas(year)
        Date.new(year, DECEMBER, 25)
      end

      alias_method :second_day_of_christmas, :boxing_day

      def official_holidays(year)
        [
          new_years_day(year),
          maundy_thursday(year),
          good_friday(year),
          easter_sunday(year),
          easter_monday(year),
          labor_day(year),
          national_holiday(year),
          ascension(year),
          pentecost_sunday(year),
          pentecost_monday(year),
          first_day_of_christmas(year),
          boxing_day(year)
        ].uniq.sort
      end
      alias_method :public_holidays, :official_holidays
      alias_method :legal_holidays, :official_holidays
    end
  end
end
