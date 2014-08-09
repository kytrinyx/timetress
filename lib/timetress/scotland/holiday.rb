module Timetress
  module Scotland
    module Holiday
      include Timetress::Holiday

      def new_year_holiday(year)
        Date.new(year, JANUARY, 2)
      end

      def may_day(year)
        first_monday_in(MAY, year)
      end

      def spring_holiday(year)
        last_monday_in(MAY, year)
      end

      def ash_wednesday(year)
        easter_sunday(year) - 46
      end

      def mothersday(year)
        # 4 days to the 1st Sunday + 3 more weeks = 25 days
        ash_wednesday(year) + 25
      end
      alias :mothering_day :mothersday

      def fathersday(year)
        third_sunday_in(JUNE, year)
      end

      private
      def first_monday_in(month, year)
        first_week = Date.new(year, month, 1)
        first_week + days_until_monday(first_week)
      end

      def last_monday_in(month, year)
        last_week = Date.new(year, month, -7)
        last_week + days_until_monday(last_week)
      end

      def days_until_monday(date)
        days_til_mon = 0
        while date.wday != 1 do
          date += 1
          days_til_mon += 1
        end
        days_til_mon
      end

      def third_sunday_in(month, year)
        third_week = Date.new(year, month, 15)
        third_week + days_til_sunday(third_week)
      end

      def days_til_sunday(date)
        -date.wday % 7
      end

    end
  end
end
